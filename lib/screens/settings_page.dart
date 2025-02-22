import 'package:coffee_shop_migrated/provider/settings_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    var darkThemetoggleValue = ref.watch(usersSettingsProvider);
    var darkTheme = ref.watch(darkThemeProvider);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Center(
              child: Text(
                'Settings',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            const SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "User Email : ",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  '${FirebaseAuth.instance.currentUser!.email}',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Dark theme : ",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Switch(
                  // This bool value toggles the switch.
                  value: darkTheme,

                  activeColor: Theme.of(context).colorScheme.primary,
                  onChanged: (bool value) async {
                    ref
                        .read(darkThemeProvider.notifier)
                        .update((state) => value);
                    await darkThemetoggleValue.setUsersThemeSettings(value);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
