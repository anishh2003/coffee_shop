import 'package:coffee_shop/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightMode = ThemeData().copyWith(
  brightness: Brightness.light,
  colorScheme: kColorLightScheme,
  textTheme: GoogleFonts.archivoNarrowTextTheme().copyWith(
    headlineLarge: GoogleFonts.archivoNarrow(
      color: kColorLightScheme.onPrimary,
      fontStyle: FontStyle.italic,
    ),
    headlineMedium: GoogleFonts.archivoNarrow(
      color: kColorLightScheme.primary,
      fontStyle: FontStyle.italic,
    ),
    headlineSmall: GoogleFonts.archivoNarrow(
      color: kColorLightScheme.primary,
      fontStyle: FontStyle.italic,
    ),
    titleSmall: GoogleFonts.archivoNarrow(
      color: kColorLightScheme.primary,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.italic,
    ),
    titleMedium: GoogleFonts.archivoNarrow(
      color: kColorLightScheme.primary,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.italic,
    ),
    titleLarge: GoogleFonts.archivoNarrow(
      color: kColorLightScheme.primary,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.italic,
    ),
    bodySmall: GoogleFonts.archivoNarrow(
      color: kColorLightScheme.primary,
      fontStyle: FontStyle.italic,
    ),
    bodyMedium: GoogleFonts.archivoNarrow(
      color: kColorLightScheme.secondary,
      fontStyle: FontStyle.italic,
      fontSize: 15.0,
    ),
    bodyLarge: GoogleFonts.archivoNarrow(
      color: kColorLightScheme.secondary,
      fontStyle: FontStyle.italic,
    ),
    labelMedium: GoogleFonts.archivoNarrow(
        color: kColorLightScheme.primary,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold,
        fontSize: 15.0),
    labelSmall: GoogleFonts.archivoNarrow(
        color: kColorLightScheme.primary,
        fontWeight: FontWeight.w100,
        fontSize: 14.0),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: kColorLightScheme.primary,
  ),
  cardTheme: CardTheme(
      surfaceTintColor: kColorLightScheme.surfaceTint, elevation: 15.0),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: kColorLightScheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5), // <-- Radius
      ),
    ),
  ),
  scrollbarTheme: ScrollbarThemeData(
    thumbColor: MaterialStateColor.resolveWith((states) {
      if (states.contains(MaterialState.pressed)) {
        return kColorLightScheme.primary
            .withOpacity(0.8); // Adjust opacity or color as needed
      }
      return kColorLightScheme.primary; // Default color when not pressed
    }),
  ),
);

ThemeData darkMode = ThemeData.dark().copyWith(
  brightness: Brightness.dark,
  colorScheme: kColorDarkScheme,
  textTheme: GoogleFonts.archivoNarrowTextTheme().copyWith(
    headlineLarge: GoogleFonts.archivoNarrow(
      color: kColorDarkScheme.onPrimary,
      fontStyle: FontStyle.italic,
    ),
    headlineMedium: GoogleFonts.archivoNarrow(
      color: kColorDarkScheme.primary,
      fontStyle: FontStyle.italic,
    ),
    headlineSmall: GoogleFonts.archivoNarrow(
      color: kColorDarkScheme.primary,
      fontStyle: FontStyle.italic,
    ),
    titleSmall: GoogleFonts.archivoNarrow(
      color: kColorDarkScheme.primary,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.italic,
    ),
    titleMedium: GoogleFonts.archivoNarrow(
      color: kColorDarkScheme.primary,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.italic,
    ),
    titleLarge: GoogleFonts.archivoNarrow(
      color: kColorDarkScheme.primary,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.italic,
    ),
    bodySmall: GoogleFonts.archivoNarrow(
      color: kColorDarkScheme.primary,
      fontStyle: FontStyle.italic,
    ),
    bodyMedium: GoogleFonts.archivoNarrow(
      color: kColorDarkScheme.secondary,
      fontStyle: FontStyle.italic,
      fontSize: 15.0,
    ),
    bodyLarge: GoogleFonts.archivoNarrow(
      color: kColorDarkScheme.secondary,
      fontStyle: FontStyle.italic,
    ),
    labelMedium: GoogleFonts.archivoNarrow(
        color: kColorDarkScheme.primary,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold,
        fontSize: 15.0),
    labelSmall: GoogleFonts.archivoNarrow(
        color: kColorDarkScheme.primary,
        fontWeight: FontWeight.w100,
        fontSize: 14.0),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: kColorDarkScheme.primary,
  ),
  cardTheme: CardTheme(
      surfaceTintColor: kColorDarkScheme.surfaceTint, elevation: 15.0),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: kColorDarkScheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5), // <-- Radius
      ),
    ),
  ),
  scrollbarTheme: ScrollbarThemeData(
    thumbColor: MaterialStateColor.resolveWith((states) {
      if (states.contains(MaterialState.pressed)) {
        return kColorDarkScheme.primary
            .withOpacity(0.8); // Adjust opacity or color as needed
      }
      return kColorDarkScheme.primary; // Default color when not pressed
    }),
  ),
);
