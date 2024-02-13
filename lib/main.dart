import 'package:coffee_shop/constants.dart';
import 'package:coffee_shop/provider/settings_provider.dart';
import 'package:coffee_shop/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextTheme appTheme = GoogleFonts.archivoNarrowTextTheme();
    var darkThemeToggle = ref.watch(lightThemeProvider);
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
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
          bodySmall: GoogleFonts.archivoNarrow(
            color: kColorScheme.primary,
            fontStyle: FontStyle.italic,
          ),
          bodyMedium: GoogleFonts.archivoNarrow(
            color: kColorScheme.secondary,
            fontStyle: FontStyle.italic,
            fontSize: 15.0,
          ),
          bodyLarge: GoogleFonts.archivoNarrow(
            color: kColorScheme.secondary,
            fontStyle: FontStyle.italic,
          ),
          labelMedium: GoogleFonts.archivoNarrow(
              color: kColorScheme.primary,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 15.0),
          labelSmall: GoogleFonts.archivoNarrow(
              color: kColorScheme.primary,
              fontWeight: FontWeight.w100,
              fontSize: 14.0),
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
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: MaterialStateColor.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return kColorScheme.primary
                  .withOpacity(0.8); // Adjust opacity or color as needed
            }
            return kColorScheme.primary; // Default color when not pressed
          }),
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
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
          bodySmall: GoogleFonts.archivoNarrow(
            color: kColorScheme.primary,
            fontStyle: FontStyle.italic,
          ),
          bodyMedium: GoogleFonts.archivoNarrow(
            color: kColorScheme.secondary,
            fontStyle: FontStyle.italic,
            fontSize: 15.0,
          ),
          bodyLarge: GoogleFonts.archivoNarrow(
            color: kColorScheme.secondary,
            fontStyle: FontStyle.italic,
          ),
          labelMedium: GoogleFonts.archivoNarrow(
              color: kColorScheme.primary,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 15.0),
          labelSmall: GoogleFonts.archivoNarrow(
              color: kColorScheme.primary,
              fontWeight: FontWeight.w100,
              fontSize: 14.0),
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
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: MaterialStateColor.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return kColorScheme.primary
                  .withOpacity(0.8); // Adjust opacity or color as needed
            }
            return kColorScheme.primary; // Default color when not pressed
          }),
        ),
      ),
      themeMode: darkThemeToggle ? ThemeMode.dark : ThemeMode.light,
      home: const Scaffold(
        body: Center(
          child: HomePage(),
        ),
      ),
    );
  }
}
