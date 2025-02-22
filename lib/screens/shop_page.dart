import 'package:coffee_shop_migrated/models/model.dart';
import 'package:coffee_shop_migrated/provider/coffeeList_provider.dart';
import 'package:coffee_shop_migrated/screens/coffee_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShopPage extends ConsumerStatefulWidget {
  const ShopPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ShopPageState();
}

class _ShopPageState extends ConsumerState<ShopPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<CoffeeModel> coffeTypesInStore = ref.watch(
      coffeeTypesAvailableProvider,
    );
    return SingleChildScrollView(
      controller: _scrollController,
      key: UniqueKey(),
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
            height: MediaQuery.of(context).size.height * 0.70,
            child: ListView.builder(
              itemCount: coffeTypesInStore.length,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 10.0,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder:
                              (context) => CoffeeDetailPage(
                                coffeeType: coffeTypesInStore[index],
                              ),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          10,
                        ), // if you need this
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
                            Text(
                              coffeTypesInStore[index].description,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            const SizedBox(height: 5.0),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      " Small:",
                                      style:
                                          Theme.of(
                                            context,
                                          ).textTheme.labelMedium,
                                    ),
                                    Text(
                                      " £${coffeTypesInStore[index].smallPrice}",
                                      style:
                                          Theme.of(
                                            context,
                                          ).textTheme.labelSmall,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      " Medium:",
                                      style:
                                          Theme.of(
                                            context,
                                          ).textTheme.labelMedium,
                                    ),
                                    Text(
                                      " £${coffeTypesInStore[index].mediumPrice}",
                                      style:
                                          Theme.of(
                                            context,
                                          ).textTheme.labelSmall,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      " Large:",
                                      style:
                                          Theme.of(
                                            context,
                                          ).textTheme.labelMedium,
                                    ),
                                    Text(
                                      " £${coffeTypesInStore[index].largePrice}",
                                      style:
                                          Theme.of(
                                            context,
                                          ).textTheme.labelSmall,
                                    ),
                                  ],
                                ),
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
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
