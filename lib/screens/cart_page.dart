import 'package:coffee_shop/models/model.dart';
import 'package:coffee_shop/payments/stripe_payment.dart';
import 'package:coffee_shop/provider/cartList_provider.dart';
import 'package:coffee_shop/provider/settings_provider.dart';
import 'package:coffee_shop/screens/coffee_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartPage extends ConsumerStatefulWidget {
  const CartPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CartPageState();
}

class _CartPageState extends ConsumerState<CartPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<CoffeeModel> coffeTypesSelected = ref.watch(cartListProvider);
    var darkThemeToggle = ref.watch(lightThemeProvider);
    return Stack(
      children: [
        SingleChildScrollView(
          controller: _scrollController,
          child: Column(
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
              Scrollbar(
                thumbVisibility: true,
                trackVisibility: true,
                child: SizedBox(
                  height: 350.0,
                  child: ListView.builder(
                      itemCount: coffeTypesSelected.length,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => CoffeeDetailPage(
                                    coffeeType: coffeTypesSelected[index],
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
                                    coffeTypesSelected[index].image,
                                    scale: 2,
                                  ),
                                  title: Text(
                                    coffeTypesSelected[index].title,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  subtitle: Column(
                                    children: [
                                      const SizedBox(height: 5.0),
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                  coffeTypesSelected[index]
                                                      .selectedSize,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelMedium),
                                              Text(
                                                  " £${coffeTypesSelected[index].selectedSizeUnitPrice}",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelSmall),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text("Quantity : ",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelMedium),
                                              Text(
                                                  coffeTypesSelected[index]
                                                      .quantity
                                                      .toString(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelSmall),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  trailing: IconButton(
                                    icon: Icon(
                                      Icons.delete,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                    onPressed: () {
                                      ref
                                          .read(cartListProvider.notifier)
                                          .removeFromList(index);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Center(
                                              child: Text(
                                                  "Coffee has been removed from the cart")),
                                        ),
                                      );
                                    },
                                  )),
                            ),
                          ),
                        );
                      })),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 1.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text('SubTotal  : ',
                              style: Theme.of(context).textTheme.titleMedium),
                          Text(
                              '£ ${ref.read(cartListProvider.notifier).subTotalPrice()}',
                              style: Theme.of(context).textTheme.labelMedium),
                        ],
                      ),
                      Row(
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text('Vat (20%) :   ',
                              style: Theme.of(context).textTheme.titleMedium),
                          Text(
                              '£ ${ref.read(cartListProvider.notifier).vatCalculation()}',
                              style: Theme.of(context).textTheme.labelMedium),
                        ],
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: SizedBox(
                            height: 10.0,
                            width: 120.0,
                            child: Divider(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text('Total  :  ',
                              style: Theme.of(context).textTheme.titleMedium),
                          Text(
                              '£ ${ref.read(cartListProvider.notifier).totalPriceForCart()}',
                              style: Theme.of(context).textTheme.titleLarge),
                        ],
                      ),
                    ]),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              width: 200.0,
              child: ElevatedButton(
                  onPressed: () async {
                    await makePayment(
                        ref.read(cartListProvider.notifier).totalPriceForCart(),
                        darkThemeToggle);
                  },
                  child: Text(
                    'Pay Now',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary),
                  )),
            ),
          ),
        )
      ],
    );
  }
}
