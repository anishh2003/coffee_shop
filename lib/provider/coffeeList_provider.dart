import 'package:coffee_shop_migrated/models/data.dart';
import 'package:coffee_shop_migrated/models/model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final coffeeTypesAvailableProvider = Provider<List<CoffeeModel>>((ref) {
  return coffeeTypes;
});

class CoffeeSelectedListNotifier extends StateNotifier<List<CoffeeModel>> {
  CoffeeSelectedListNotifier() : super([...coffeeTypes]);

  void updateQuantityOfCoffeeType(int index, String quantitySelected) {
    CoffeeModel coffeeSelected = state.firstWhere(
      (coffeeType) => coffeeType.id == index,
    );
    coffeeSelected.quantity = int.parse(quantitySelected);
    state = [...state];
  }

  void updateSelectedCoffeeSize(int coffeeTypeId, int toggleIndex) {
    state =
        state.map((coffeeType) {
          if (coffeeType.id == coffeeTypeId) {
            // Update the toggleButtonStatusIndex
            coffeeType.toggleButtonStatusIndex = toggleIndex;

            // Update the toggleButtonStatus list
            coffeeType.toggleButtonStatus = List.generate(
              coffeeType.toggleButtonStatus.length,
              (index) => index == toggleIndex,
            );
          }
          return coffeeType;
        }).toList();
  }

  void selectedCoffeeTypePrice(int index, int toggleIndex) {
    CoffeeModel coffeeSelected = state.firstWhere(
      (coffeeType) => coffeeType.id == index,
    );

    switch (toggleIndex) {
      case 0:
        coffeeSelected.priceBasedOnQuantity =
            coffeeSelected.smallPrice * coffeeSelected.quantity;
        coffeeSelected.selectedSize = "Small";
        coffeeSelected.selectedSizeUnitPrice = coffeeSelected.smallPrice;
        break;
      case 1:
        coffeeSelected.priceBasedOnQuantity =
            coffeeSelected.mediumPrice * coffeeSelected.quantity;
        coffeeSelected.selectedSize = "Medium";
        coffeeSelected.selectedSizeUnitPrice = coffeeSelected.mediumPrice;
        break;
      case 2:
        coffeeSelected.priceBasedOnQuantity =
            coffeeSelected.largePrice * coffeeSelected.quantity;
        coffeeSelected.selectedSize = "Large";
        coffeeSelected.selectedSizeUnitPrice = coffeeSelected.largePrice;
        break;
    }

    state = [...state];
  }
}

final coffeeSelectedProvider =
    StateNotifierProvider<CoffeeSelectedListNotifier, List<CoffeeModel>>((ref) {
      return CoffeeSelectedListNotifier();
    });
