import 'package:coffee_shop/screens/cart_page.dart';
import 'package:coffee_shop/screens/shop_page.dart';
import 'package:coffee_shop/widgets/bottom_nav_bar.dart';
import 'package:coffee_shop/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int _selectedIndex = 0;

  navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = const [
    ShopPage(),
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
      appBar: AppBar(
        title: Center(
          child: Text(
            'Coffee House',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        iconTheme: IconThemeData(
            color: Theme.of(context)
                .colorScheme
                .onPrimary), //changes the drawer burger button icon color
      ),
      drawer: const DrawerWidget(),
      bottomNavigationBar: SizedBox(
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                  width: 2.0, color: Theme.of(context).colorScheme.primary),
              // bottom: BorderSide(width: 16.0, color: Colors.lightBlue.shade900),
            ),
            color: Colors.white,
          ),
          child: BottomNavBar(
            onTabChange: (index) => navigateBottomBar(index),
          ),
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
