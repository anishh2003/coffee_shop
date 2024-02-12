import 'package:coffee_shop/provider/coffeeAmount_provider.dart';
import 'package:coffee_shop/widgets/quantity_selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoffeeDetailPage extends ConsumerStatefulWidget {
  const CoffeeDetailPage({
    super.key,
    required this.image,
  });

  final String image;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CoffeeDetailPageState();
}

class _CoffeeDetailPageState extends ConsumerState<CoffeeDetailPage> {
  List<bool> toggleButtonStatus = [true, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            widget.image,
            scale: 5.0,
          ),
          const QuantitySelection(),
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
                  setState(() {
                    for (int buttonIndex = 0;
                        buttonIndex < toggleButtonStatus.length;
                        buttonIndex++) {
                      if (buttonIndex == index) {
                        toggleButtonStatus[index] = !toggleButtonStatus[index];
                      } else {
                        toggleButtonStatus[buttonIndex] =
                            false; // Set other buttons to false
                      }
                    }
                  });
                },
                isSelected: toggleButtonStatus,
                children: const [
                  Text('S'),
                  Text('M'),
                  Text('L'),
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
                      onPressed: () {},
                      child: Text(
                        'Add to Cart',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimary, // Change to your desired color
                                ),
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
