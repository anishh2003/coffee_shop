import 'package:coffee_shop/provider/settings_provider.dart';
import 'package:coffee_shop/screens/home_page.dart';
import 'package:coffee_shop/widgets/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var darkThemeToggle = ref.watch(lightThemeProvider);
    return MaterialApp(
      theme: lightMode,
      darkTheme: darkMode,
      themeMode: darkThemeToggle ? ThemeMode.dark : ThemeMode.light,
      home: const Scaffold(
        body: Center(
          child: HomePage(),
        ),
      ),
    );
  }
}
