import 'package:coffee_shop/screens/home_page.dart';
import 'package:flutter/material.dart';

class ReceiptPage extends StatefulWidget {
  const ReceiptPage({super.key});

  @override
  State<ReceiptPage> createState() => _ReceiptPageState();
}

class _ReceiptPageState extends State<ReceiptPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'lib/assets/logo.png',
              scale: 2,
            ),
            Text("Thanks for buying our Coffee !!",
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 40.0),
            Text("Please collect you're coffee  ",
                style: Theme.of(context).textTheme.headlineMedium),
            Text("at the counter ",
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 40.0),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
                child: Text(
                  'Home',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Theme.of(context).colorScheme.onPrimary),
                )),
          ],
        ),
      ),
    );
  }
}
