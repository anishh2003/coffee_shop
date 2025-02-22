import 'package:coffee_shop_migrated/screens/about_us.dart';
import 'package:coffee_shop_migrated/screens/settings_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: Stack(
        children: [
          ListView(
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
                  leading: Image.asset('lib/assets/logo.png', scale: 20),
                  title: Text(
                    'About Us',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const AboutUs()),
                    );
                  },
                ),
              ),
              ListTile(
                leading: Image.asset('lib/assets/settings.png', scale: 20),
                title: Text(
                  'Settings',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SettingsPage(),
                    ),
                  );
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.40),
              ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Theme.of(context).colorScheme.primary,
                ),
                title: Text(
                  'Log Out',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                onTap: () => FirebaseAuth.instance.signOut(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
