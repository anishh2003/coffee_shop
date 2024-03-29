import 'package:coffee_shop/provider/settings_provider.dart';
import 'package:coffee_shop/screens/home_page.dart';
import 'package:coffee_shop/widgets/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import '.env';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = PUBLISHABLE_KEY;
  Stripe.instance.applySettings();
  //Load our .env file that contains our Stripe Secret key
  await dotenv.load(fileName: "lib/.env");
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var initialiseSettings = ref.watch(initialiseSettingsProvider);
    var darkThemeToggle = ref.watch(darkThemeProvider);

    return initialiseSettings.when(
      data: (data) => MaterialApp(
        theme: lightMode,
        darkTheme: darkMode,
        themeMode: darkThemeToggle ? ThemeMode.dark : ThemeMode.light,
        home: const Scaffold(
          body: Center(
            child: HomePage(),
          ),
        ),
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
  }
}
