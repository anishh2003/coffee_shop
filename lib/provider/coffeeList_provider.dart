import 'package:coffee_shop/models/data.dart';
import 'package:coffee_shop/models/model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final coffeeTypesAvailableProvider = Provider<List<CoffeeModel>>((ref) {
  return coffeeTypes;
});

class CoffeeSelectedListNotifier extends StateNotifier<List<CoffeeModel>> {
  CoffeeSelectedListNotifier() : super([...coffeeTypes]);

  void updateQuantityOfCoffeeType(int index, String quantitySelected) {
    CoffeeModel coffeeSelected =
        state.firstWhere((coffeeType) => coffeeType.id == index);
    coffeeSelected.quantity = int.parse(quantitySelected);
    state = [...state];
  }

  void selectedCoffeeTypePrice(int index, int toggleIndex) {
    CoffeeModel coffeeSelected =
        state.firstWhere((coffeeType) => coffeeType.id == index);

    switch (toggleIndex) {
      case 0:
        coffeeSelected.priceBasedOnQuantity =
            coffeeSelected.smallPrice * coffeeSelected.quantity;
        coffeeSelected.selectedSize = "Small";
      case 1:
        coffeeSelected.priceBasedOnQuantity =
            coffeeSelected.mediumPrice * coffeeSelected.quantity;
        coffeeSelected.selectedSize = "Medium";
      case 2:
        coffeeSelected.priceBasedOnQuantity =
            coffeeSelected.largePrice * coffeeSelected.quantity;
        coffeeSelected.selectedSize = "Large";
    }

    state = [...state];
  }
}

final coffeeSelectedProvider =
    StateNotifierProvider<CoffeeSelectedListNotifier, List<CoffeeModel>>((ref) {
  return CoffeeSelectedListNotifier();
});
