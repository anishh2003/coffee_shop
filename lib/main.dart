import 'package:coffee_shop_migrated/provider/settings_provider.dart';
import 'package:coffee_shop_migrated/screens/authentication/auth_page.dart';
import 'package:coffee_shop_migrated/widgets/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import '.env';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = PUBLISHABLE_KEY;
  Stripe.instance.applySettings();
  //Load our .env file that contains our Stripe Secret key
  await dotenv.load(fileName: "lib/.env");
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var darkThemeToggle = ref.watch(darkThemeProvider);
    return MaterialApp(
      theme: lightMode,
      darkTheme: darkMode,
      themeMode: darkThemeToggle ? ThemeMode.dark : ThemeMode.light,
      home: const Scaffold(body: Center(child: AuthPage())),
    );
  }
}
