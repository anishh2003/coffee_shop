import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            curve: Curves.fastOutSlowIn,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Image.asset('lib/assets/logo.png'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: ListTile(
              leading: Image.asset(
                'lib/assets/logo.png',
                scale: 20,
              ),
              title: Text(
                'About Us',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ),
          ListTile(
            leading: Image.asset(
              'lib/assets/settings.png',
              scale: 20,
            ),
            title: Text(
              'Settings',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),
    );
  }
}
