import 'package:coffee_shop/models/data.dart';
import 'package:coffee_shop/models/model.dart';
import 'package:coffee_shop/provider/coffeeAmount_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final coffeeTypesAvailableProvider = Provider<List<CoffeeModel>>((ref) {
  return coffeeTypes;
});

// class CoffeListNotifier extends StateNotifier<List<CoffeeModel>> {
//   CoffeListNotifier() : super([...coffeeTypes]);

//   void updateQuantityOfCoffeeType(int index, String quantitySelected) {
//     state.map((coffeeType) => coffeeType.id == index
//         ? coffeeType.quantity = int.parse(quantitySelected)
//         : coffeeType.quantity);
//     state = [...state];
//     print(state);
//     // state.map((coffeeType) => coffeeType.id == index
//     //     ? coffeeType.quantity = coffeeType.quantity + 1
//     //     : coffeeType.quantity);
//     // state = [...state];
//     // for (int coffeeTypeIndex = 0;
//     //     coffeeTypeIndex < state.length;
//     //     coffeeTypeIndex++) {
//     //   if (coffeeTypeIndex == index) {
//     //     state[coffeeTypeIndex].quantity = state[coffeeTypeIndex].quantity + 1;
//     //     return;
//     //   }
//     // }
//   }
//   //   void removeQuantityOfCoffeeType(int index) {
//   //   state.map((coffeeType) => coffeeType.id == index
//   //       ? coffeeType.quantity = coffeeType.quantity - 1
//   //       : coffeeType.quantity);
//   //   state = [...state];
//   // }
// }

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
      case 1:
        coffeeSelected.priceBasedOnQuantity =
            coffeeSelected.mediumPrice * coffeeSelected.quantity;
      case 2:
        coffeeSelected.priceBasedOnQuantity =
            coffeeSelected.largePrice * coffeeSelected.quantity;
    }

    state = [...state];
  }
}

final coffeeSelectedProvider =
    StateNotifierProvider<CoffeeSelectedListNotifier, List<CoffeeModel>>((ref) {
  ref.watch(coffeeTypeAmountProvider);
  return CoffeeSelectedListNotifier();
});
