import 'package:flutter_riverpod/flutter_riverpod.dart';

String quantity = '0';
final coffeeTypeQuantityProvider = StateProvider<String>((ref) {
  return quantity;
});

// class CoffeTypeQuantityNotifier extends StateNotifier<String> {
//   CoffeTypeQuantityNotifier() : super('0');

//   String quantity = '0';

//   String addAmount(String textFieldValue) {
//     int intValue = int.parse(textFieldValue);
//     return intValue.toString();
//   }
// }

// final coffeeListProvider =
//     StateNotifierProvider<CoffeTypeQuantityNotifier, String>((ref) {
//   return CoffeTypeQuantityNotifier();
// });
