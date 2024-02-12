import 'package:coffee_shop/models/model.dart';
import 'package:coffee_shop/provider/coffeeList_provider.dart';
import 'package:coffee_shop/provider/coffeeAmount_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuantitySelection extends ConsumerStatefulWidget {
  const QuantitySelection({
    super.key,
    required this.coffeeType,
  });

  final CoffeeModel coffeeType;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _QuantitySelectionState();
}

class _QuantitySelectionState extends ConsumerState<QuantitySelection> {
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
                  textController.text = ref
                      .read(coffeeTypeAmountProvider.notifier)
                      .reduceAmount(textController.text);
                  ref
                      .read(coffeeSelectedProvider.notifier)
                      .updateQuantityOfCoffeeType(
                          widget.coffeeType.id, textController.text);
                },
                icon: Icon(
                  Icons.minimize,
                  color: Theme.of(context).colorScheme.primary,
                ),
              )),
              Expanded(
                child: TextField(
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                  controller: textController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary),
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
                  textController.text = ref
                      .read(coffeeTypeAmountProvider.notifier)
                      .addAmount(textController.text);
                  ref
                      .read(coffeeSelectedProvider.notifier)
                      .updateQuantityOfCoffeeType(
                          widget.coffeeType.id, textController.text);
                },
                icon: Icon(Icons.add,
                    color: Theme.of(context).colorScheme.primary),
              )),
            ],
          ),
        ),
      ],
    );
  }
}
