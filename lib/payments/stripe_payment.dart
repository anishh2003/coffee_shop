import 'dart:convert';

import 'package:coffee_shop/screens/receipt_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

dynamic paymentIntent;

Future<void> makePayment(
    BuildContext context, String cartAmount, bool darkThemeToggle) async {
  try {
    //STEP 1: Create Payment Intent
    paymentIntent = await createPaymentIntent(cartAmount, 'GBP');

    //STEP 2: Initialize Payment Sheet
    await Stripe.instance
        .initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: paymentIntent!['client_secret'],
              /* TODO : even though darkThemeToggle has been implemented, 
                 the card theme only changes based on setting dark mode through
                 phone's accessibility options. */
              style: darkThemeToggle ? ThemeMode.dark : ThemeMode.light,
              merchantDisplayName: 'Coffee House'),
        )
        .then((value) {});

    //STEP 3: Display Payment sheet
    displayPaymentSheet(context);
  } catch (err) {
    throw Exception(err);
  }
}

createPaymentIntent(String amount, String currency) async {
  try {
    //Request body
    Map<String, dynamic> body = {
      'amount': calculateAmount(amount),
      'currency': currency,
    };

    //Make post request to Stripe
    var response = await http.post(
      Uri.parse('https://api.stripe.com/v1/payment_intents'),
      headers: {
        'Authorization': 'Bearer ${dotenv.env['const STRIPE_SECRET']}',
        'Content-Type': 'application/x-www-form-urlencoded'
      },
      body: body,
    );
    return json.decode(response.body);
  } catch (err) {
    throw Exception(err.toString());
  }
}

calculateAmount(String amount) {
  if (amount.contains('.')) {
    amount = amount.replaceAll('.', ''); // Remove the period from the string
  }
  final calculatedAmount = (int.parse(amount));
  return calculatedAmount.toString();
}

displayPaymentSheet(BuildContext context) async {
  try {
    await Stripe.instance.presentPaymentSheet().then((value) {
      showDialog(
          context: context,
          builder: (_) => const AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 100.0,
                    ),
                    SizedBox(height: 10.0),
                    Text("Payment Successful!"),
                  ],
                ),
              ));

      paymentIntent = null;
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const ReceiptPage(),
        ),
      );
    }).onError((error, stackTrace) {
      throw Exception(error);
    });
  } on StripeException catch (e) {
    print('Error is:---> $e');
    const AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(
                Icons.cancel,
                color: Colors.red,
              ),
              Text("Payment Failed"),
            ],
          ),
        ],
      ),
    );
  } catch (e) {
    print('$e');
  }
}
