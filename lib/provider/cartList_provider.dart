import 'package:coffee_shop_migrated/models/model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartListNotifier extends StateNotifier<List<CoffeeModel>> {
  CartListNotifier() : super([]);

  static double subtotalPrice = 0.0;
  static double vatPrice = 0.0;
  static double totalPrice = 0.0;

  void addToList(CoffeeModel coffeeType) {
    state = [...state, coffeeType];
  }

  void removeFromList(index) {
    List<CoffeeModel> newCoffeeSelected =
        state
            .where((coffeeType) => state.indexOf(coffeeType) != index)
            .toList();
    state = [...newCoffeeSelected];
  }

  String subTotalPrice() {
    subtotalPrice = 0.0;
    for (var items in state) {
      subtotalPrice += items.priceBasedOnQuantity;
    }
    return subtotalPrice.toStringAsFixed(2);
  }

  String vatCalculation() {
    vatPrice = 0.20 * subtotalPrice;

    return vatPrice.toStringAsFixed(2);
  }

  String totalPriceForCart() {
    totalPrice = subtotalPrice + vatPrice;

    return totalPrice.toStringAsFixed(2);
  }
}

final cartListProvider =
    StateNotifierProvider<CartListNotifier, List<CoffeeModel>>((ref) {
      return CartListNotifier();
    });
