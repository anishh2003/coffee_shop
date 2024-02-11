import 'package:flutter_riverpod/flutter_riverpod.dart';

String quantity = '0';
final coffeeTypeQuantityProvider = StateProvider<String>((ref) {
  return quantity;
});

class CoffeTypeQuantityNotifier extends StateNotifier<String> {
  CoffeTypeQuantityNotifier() : super('0');

  String addAmount(String textFieldValue) {
    int intValue = int.parse(textFieldValue);
    if (intValue >= 15) {
      intValue = 15;
    } else {
      intValue = intValue + 1;
    }

    return intValue.toString();
  }

  String reduceAmount(String textFieldValue) {
    int intValue = int.parse(textFieldValue);
    if (intValue <= 0) {
      intValue = 0;
    } else {
      intValue = intValue - 1;
    }

    return intValue.toString();
  }
}

final coffeeTypeAmountProvider =
    StateNotifierProvider<CoffeTypeQuantityNotifier, String>((ref) {
  return CoffeTypeQuantityNotifier();
});
