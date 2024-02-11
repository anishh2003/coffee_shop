import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends ConsumerWidget {
  BottomNavBar({super.key, required this.onTabChange});

  void Function(int)? onTabChange;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GNav(
        backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
        onTabChange: (index) => onTabChange!(index),
        tabMargin: const EdgeInsets.all(20),
        mainAxisAlignment: MainAxisAlignment.center,
        tabBorderRadius: 15,
        tabActiveBorder:
            Border.all(color: Colors.black, width: 1), // tab button border
        tabBorder:
            Border.all(color: Colors.grey, width: 1), // tab button border
        tabShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)
        ], // tab button shadow

        gap: 0, // the tab button gap between icon and text
        color: Colors.grey[800], // unselected icon color
        activeColor: Theme.of(context).colorScheme.primary,
        iconSize: 45,
        tabBackgroundColor:
            Colors.brown.withOpacity(0.1), // selected tab background color
        padding: const EdgeInsets.symmetric(
            horizontal: 10, vertical: 5), // navigation bar padding
        tabs: const [
          GButton(
            icon: Icons.coffee,
            text: "Coffee",
          ),
          GButton(
            icon: Icons.credit_card,
            text: "Pay",
          ),
        ]);
  }
}
