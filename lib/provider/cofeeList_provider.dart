import 'package:coffee_shop/models/data.dart';
import 'package:coffee_shop/models/model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final coffeeTypesAvailableProvider = Provider<List<CoffeeModel>>((ref) {
  return coffeeTypes;
});

class CoffeListNotifier extends StateNotifier<List<CoffeeModel>> {
  CoffeListNotifier() : super([]);
}

final coffeeListProvider =
    StateNotifierProvider<CoffeListNotifier, List<CoffeeModel>>((ref) {
  return CoffeListNotifier();
});
