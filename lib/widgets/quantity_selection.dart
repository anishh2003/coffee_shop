import 'package:coffee_shop_migrated/models/model.dart';
import 'package:coffee_shop_migrated/provider/coffeeAmount_provider.dart';
import 'package:coffee_shop_migrated/provider/coffeeList_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuantitySelection extends ConsumerStatefulWidget {
  const QuantitySelection({
    super.key,
    required this.coffeeType,
    required this.textController,
  });

  final CoffeeModel coffeeType;
  final TextEditingController textController;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _QuantitySelectionState();
}

class _QuantitySelectionState extends ConsumerState<QuantitySelection> {
  @override
  Widget build(BuildContext context) {
    ref.watch(coffeeTypeAmountProvider);
    ref.watch(coffeeSelectedProvider);
    return Column(
      children: [
        Text("QUANTITY", style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 30.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100.0),
          child: Row(
            children: [
              Expanded(
                child: IconButton(
                  onPressed: () {
                    widget.textController.text = ref
                        .read(coffeeTypeAmountProvider.notifier)
                        .reduceAmount(widget.textController.text);
                    ref
                        .read(coffeeSelectedProvider.notifier)
                        .updateQuantityOfCoffeeType(
                          widget.coffeeType.id,
                          widget.textController.text,
                        );
                  },
                  icon: Icon(
                    Icons.minimize,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              Expanded(
                child: TextField(
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                  controller: widget.textController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: IconButton(
                  onPressed: () {
                    widget.textController.text = ref
                        .read(coffeeTypeAmountProvider.notifier)
                        .addAmount(widget.textController.text);
                    ref
                        .read(coffeeSelectedProvider.notifier)
                        .updateQuantityOfCoffeeType(
                          widget.coffeeType.id,
                          widget.textController.text,
                        );
                  },
                  icon: Icon(
                    Icons.add,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
