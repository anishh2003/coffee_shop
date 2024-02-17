import 'package:coffee_shop/provider/settings_provider.dart';
import 'package:coffee_shop/screens/authentication/login_page.dart';
import 'package:coffee_shop/screens/home_page.dart';
import 'package:coffee_shop/widgets/theme_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthPage extends ConsumerWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var initialiseSettings = ref.watch(initialiseSettingsProvider);

    return Scaffold(
        //TODO : use StreamProvider
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              // user is logged in
              if (snapshot.hasData) {
                return initialiseSettings.when(
                  data: (data) => const Scaffold(
                    body: HomePage(),
                  ),
                  error: (error, stackTrace) => MaterialApp(
                    home: Scaffold(
                      body: Center(
                        child: Text("Error encountered : $error"),
                      ),
                    ),
                  ),
                  loading: () {
                    return MaterialApp(
                      home: Center(
                        child: CircularProgressIndicator(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const LoginPage();
              }
            }));
  }
}
