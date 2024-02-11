import 'package:coffee_shop/constants.dart';
import 'package:coffee_shop/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
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
            color: kColorScheme.onPrimary,
            fontStyle: FontStyle.italic,
          ),
          headlineMedium: GoogleFonts.archivoNarrow(
            color: kColorScheme.primary,
            fontStyle: FontStyle.italic,
          ),
          headlineSmall: GoogleFonts.archivoNarrow(
            color: kColorScheme.primary,
            fontStyle: FontStyle.italic,
          ),
          titleSmall: GoogleFonts.archivoNarrow(
            color: kColorScheme.primary,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.italic,
          ),
          titleMedium: GoogleFonts.archivoNarrow(
            color: kColorScheme.primary,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.italic,
          ),
          titleLarge: GoogleFonts.archivoNarrow(
            color: kColorScheme.primary,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.italic,
          ),
          bodyLarge: GoogleFonts.archivoNarrow(
            color: kColorScheme.secondary,
            fontStyle: FontStyle.italic,
          ),
          labelMedium: GoogleFonts.archivoNarrow(
              color: kColorScheme.secondary,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 15.0),
          labelSmall: GoogleFonts.archivoNarrow(
              color: kColorScheme.secondary,
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
        textTheme: GoogleFonts.robotoSerifTextTheme().copyWith(
          headlineLarge: GoogleFonts.roboto(
              textStyle: Theme.of(context).textTheme.headlineLarge,
              fontStyle: FontStyle.italic),
          bodyLarge: GoogleFonts.roboto(
              textStyle: Theme.of(context).textTheme.bodyLarge,
              fontStyle: FontStyle.italic),
          labelMedium: GoogleFonts.roboto(
              textStyle: Theme.of(context).textTheme.labelMedium,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 15.0),
          labelSmall: GoogleFonts.roboto(
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
      themeMode: ThemeMode.system,
      home: const Scaffold(
        body: Center(
          child: HomePage(),
        ),
      ),
    );
  }
}
