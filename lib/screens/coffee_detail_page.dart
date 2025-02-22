import 'package:coffee_shop_migrated/models/model.dart';
import 'package:coffee_shop_migrated/provider/cartList_provider.dart';
import 'package:coffee_shop_migrated/provider/coffeeList_provider.dart';
import 'package:coffee_shop_migrated/widgets/quantity_selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoffeeDetailPage extends ConsumerStatefulWidget {
  const CoffeeDetailPage({super.key, required this.coffeeType});

  final CoffeeModel coffeeType;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CoffeeDetailPageState();
}

class _CoffeeDetailPageState extends ConsumerState<CoffeeDetailPage> {
  late TextEditingController textController;

  @override
  void initState() {
    textController = TextEditingController(text: '0');

    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(coffeeSelectedProvider);
    ref.watch(cartListProvider);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(widget.coffeeType.image, scale: 5.0),
          QuantitySelection(
            coffeeType: widget.coffeeType,
            textController: textController,
          ),
          Column(
            children: [
              Text("SIZE", style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 10.0),
              ToggleButtons(
                fillColor: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(10.0),
                selectedColor: Theme.of(context).colorScheme.onPrimary,
                disabledColor: Colors.grey,
                onPressed: (index) {
                  ref
                      .read(coffeeSelectedProvider.notifier)
                      .updateSelectedCoffeeSize(widget.coffeeType.id, index);
                },
                isSelected: widget.coffeeType.toggleButtonStatus,
                children: const [Text('S'), Text('M'), Text('L')],
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '£${widget.coffeeType.smallPrice.toString()}',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  const SizedBox(width: 20.0),
                  Text(
                    '£${widget.coffeeType.mediumPrice.toString()}',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  const SizedBox(width: 20.0),
                  Text(
                    '£${widget.coffeeType.largePrice.toString()}',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed:
                        (textController.text != '0' &&
                                /* checks if any toggle button has been selected*/
                                widget.coffeeType.toggleButtonStatus.any(
                                  (sizeSelected) => sizeSelected == true,
                                ))
                            ? () {
                              ref
                                  .read(coffeeSelectedProvider.notifier)
                                  .selectedCoffeeTypePrice(
                                    widget.coffeeType.id,
                                    widget.coffeeType.toggleButtonStatusIndex,
                                  );

                              ref.read(cartListProvider).add(widget.coffeeType);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Center(
                                    child: Text(
                                      "Coffee has been added to the cart",
                                    ),
                                  ),
                                ),
                              );
                              Future.delayed(const Duration(seconds: 1), () {
                                return Navigator.pop(context);
                              });
                            }
                            : null,
                    child: Text(
                      'Add to Cart',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
