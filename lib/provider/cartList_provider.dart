import 'package:coffee_shop/models/model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartListNotifier extends StateNotifier<List<CoffeeModel>> {
  CartListNotifier() : super([]);

  void addToList(CoffeeModel coffeeType) {
    state = [...state, coffeeType];
  }

  void removeFromList(index) {
    List<CoffeeModel> newCoffeeSelected =
        state.where((coffeeType) => state[index].id != index).toList();
    state = [...newCoffeeSelected];
  }
}

final cartListProvider =
    StateNotifierProvider<CartListNotifier, List<CoffeeModel>>((ref) {
  return CartListNotifier();
});
