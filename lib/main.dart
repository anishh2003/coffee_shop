import 'package:coffee_shop/constants.dart';
import 'package:coffee_shop/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(ProviderScope(child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme appTheme = GoogleFonts.archivoNarrowTextTheme();

    return MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        textTheme: appTheme.copyWith(
          headlineLarge: GoogleFonts.archivoNarrow(
              textStyle: Theme.of(context).textTheme.headlineLarge,
              fontStyle: FontStyle.italic),
          bodyLarge: GoogleFonts.archivoNarrow(
              textStyle: Theme.of(context).textTheme.bodyLarge,
              fontStyle: FontStyle.italic),
          labelMedium: GoogleFonts.archivoNarrow(
              textStyle: Theme.of(context).textTheme.labelMedium,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 15.0),
          labelSmall: GoogleFonts.archivoNarrow(
              textStyle: Theme.of(context).textTheme.labelMedium,
              fontWeight: FontWeight.w100,
              fontSize: 15.0),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: kColorScheme.primary,
        ),
        cardTheme: CardTheme(
            surfaceTintColor: kColorScheme.surfaceTint, elevation: 15.0),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5), // <-- Radius
            ),
          ),
        ),
      ),
      darkTheme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: AppBarTheme(
          backgroundColor: kColorScheme.primary,
        ),
      ),
      themeMode: ThemeMode.system,
      home: const Scaffold(
        body: Center(
          child: HomePage(),
        ),
      ),
    );
  }
}
