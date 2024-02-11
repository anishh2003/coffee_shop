import 'package:coffee_shop/provider/cofeeList_provider.dart';
import 'package:coffee_shop/provider/coffeeAmount_provider.dart';
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
  late TextEditingController textController;
  List<bool> toggleButtonStatus = [true, false, false];
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
    var quantityDesired = ref.watch(coffeeTypeQuantityProvider);
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            widget.image,
            scale: 5.0,
          ),
          Column(
            children: [
              Text("QUANTITY",
                  style: Theme.of(context).textTheme.headlineLarge),
              SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100.0),
                child: Row(
                  children: [
                    Expanded(
                        child: IconButton(
                      onPressed: () {
                        textController.text = ref
                            .read(coffeeTypeQuantityProvider.notifier)
                            .update((state) {
                          int.parse(state) > 0
                              ? state = (int.parse(state) - 1).toString()
                              : 0;
                          return state;
                        });
                      },
                      icon: const Icon(Icons.minimize),
                    )),
                    Expanded(
                      child: TextField(
                        textAlign: TextAlign.center,
                        controller: textController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
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
                            .read(coffeeTypeQuantityProvider.notifier)
                            .update((state) {
                          int.parse(state) < 15
                              ? state = (int.parse(state) + 1).toString()
                              : 15;
                          return state;
                        });
                      },
                      icon: const Icon(Icons.add),
                    )),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text("SIZE", style: Theme.of(context).textTheme.headlineLarge),
              SizedBox(height: 10.0),
              ToggleButtons(
                selectedColor: Colors.red,
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
