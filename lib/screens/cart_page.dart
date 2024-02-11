import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: SizedBox(
      height: 800.0,
      child: ListView.builder(
          itemCount: 3,
          itemBuilder: ((context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10.0),
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.delete),
                  title: Text(
                    'Cart',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                  subtitle: Text(
                    'Cart',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                  trailing: Icon(Icons.delete),
                ),
              ),
            );
          })),
    ));
  }
}
