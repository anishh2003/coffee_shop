import 'package:coffee_shop/models/model.dart';
import 'package:coffee_shop/provider/cofeeList_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShopPage extends ConsumerWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<CoffeeModel> coffeTypesInStore =
        ref.watch(coffeeTypesAvailableProvider);
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Select from our range of coffees :",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          SizedBox(
            height: 440.0,
            child: ListView.builder(
                itemCount: coffeTypesInStore.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10.0),
                    child: Card(
                      child: ListTile(
                        leading: Image.asset(
                          coffeTypesInStore[index].image,
                          scale: 2,
                        ),
                        title: Text(
                          coffeTypesInStore[index].title,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        subtitle: Column(
                          children: [
                            Text(
                              coffeTypesInStore[index].description,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            const SizedBox(height: 5.0),
                            Column(
                              children: [
                                Stack(
                                  children: [
                                    Row(
                                      children: [
                                        Text(" Small:",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium),
                                        Text(
                                            " £${coffeTypesInStore[index].price}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelSmall),
                                      ],
                                    ),
                                    Positioned(
                                      right: 1.0,
                                      child: Row(
                                        children: [
                                          Text(" Medium:",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium),
                                          Text(
                                              " £${coffeTypesInStore[index].price + 0.5}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelSmall),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(" Large:",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium),
                                    Text(
                                        " £${coffeTypesInStore[index].price + 1}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        trailing: Icon(
                          Icons.arrow_forward,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  );
                })),
          ),
        ],
      ),
    );
  }
}
