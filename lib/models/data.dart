import 'package:coffee_shop/models/model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<CoffeeModel> coffeeTypes = [
  CoffeeModel(
    id: 1,
    title: 'Espresso',
    description:
        "A very strong coffee drink as opposed to the slightly milder flavour of black coffee.",
    image: 'lib/assets/espresso.png',
    price: 1.30,
  ),
  CoffeeModel(
    id: 2,
    title: 'Cortado',
    description:
        "This Spanish-style coffee contains an equal amount of Espresso and steamed milk. ",
    image: 'lib/assets/cortado.png',
    price: 2,
  ),
  CoffeeModel(
    id: 3,
    title: 'Mocha',
    description:
        " A mocha is similar to a latte or cappuccino in that it's made from espresso and steamed milk. ",
    image: 'lib/assets/mocha.png',
    price: 2.50,
  ),
  CoffeeModel(
    id: 4,
    title: 'Cafe au Lait ',
    description: "Cafe au Lait is coffee with milk.",
    image: 'lib/assets/cafeaulait.png',
    price: 2,
  )
];