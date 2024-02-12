import 'package:coffee_shop/models/model.dart';
import 'package:coffee_shop/provider/cofeeList_provider.dart';
import 'package:coffee_shop/screens/coffee_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<CoffeeModel> coffeTypesInStore =
        ref.watch(coffeeTypesAvailableProvider);
    return Stack(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Your Selection :",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
            SizedBox(
              height: 350.0,
              child: ListView.builder(
                  itemCount: coffeTypesInStore.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 10.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => CoffeeDetailPage(
                                coffeeType: coffeTypesInStore[index],
                              ),
                            ),
                          );
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                              width: 1,
                            ),
                          ),
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
                                const SizedBox(height: 5.0),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(" Small:",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium),
                                        Text(
                                            " £${coffeTypesInStore[index].smallPrice}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelSmall),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(" Quantity:",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium),
                                        Text(" 10",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelSmall),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            trailing: Icon(
                              Icons.delete,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                      ),
                    );
                  })),
            ),
          ],
        ),
        Positioned(
          right: 20.0,
          bottom: 10.0,
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Row(
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text('SubTotal  : ',
                    style: Theme.of(context).textTheme.titleMedium),
                Text('£100.0', style: Theme.of(context).textTheme.labelMedium),
              ],
            ),
            Row(
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text('Vat (20%) :   ',
                    style: Theme.of(context).textTheme.titleMedium),
                Text('£10.0', style: Theme.of(context).textTheme.labelMedium),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0),
              child: SizedBox(
                height: 10.0,
                width: 100.0,
                child: Divider(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            Row(
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text('Total  :  ',
                    style: Theme.of(context).textTheme.titleMedium),
                Text('£120.0', style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
          ]),
        ),
      ],
    );
  }
}
