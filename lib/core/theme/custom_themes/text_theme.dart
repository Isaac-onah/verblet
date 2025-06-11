
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:verblet/core/theme/app_pallete.dart';

class MyTextTheme {
  MyTextTheme._();

  ///controlls the lightTexttheme
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: GoogleFonts.lobster(
        textStyle: const TextStyle().copyWith(
            fontSize: 30.0, fontWeight: FontWeight.bold, color: MyColors.secondary)),
    headlineMedium: GoogleFonts.lobster(
        textStyle: const TextStyle().copyWith(
            fontSize: 20.0, fontWeight: FontWeight.w600, color: MyColors.secondary)),
    headlineSmall: GoogleFonts.lobster(
        textStyle: const TextStyle().copyWith(
            fontSize: 18.0, fontWeight: FontWeight.w600, color: MyColors.secondary)),
    titleLarge: GoogleFonts.lobster(
        textStyle: const TextStyle().copyWith(
            fontSize: 16.0, fontWeight: FontWeight.w600, color: MyColors.secondary)),
    titleMedium: GoogleFonts.robotoCondensed(
        textStyle: const TextStyle().copyWith(
            fontSize: 16.0, fontWeight: FontWeight.w500, color: MyColors.secondary)),
    titleSmall: GoogleFonts.robotoCondensed(
        textStyle: const TextStyle().copyWith(
            fontSize: 16.0, fontWeight: FontWeight.w400, color: MyColors.secondary)),
    bodyLarge: GoogleFonts.robotoCondensed(
        textStyle: const TextStyle().copyWith(
            fontSize: 14.0, fontWeight: FontWeight.w500, color: MyColors.secondary)),
    bodyMedium: GoogleFonts.robotoCondensed(
        textStyle: const TextStyle().copyWith(
            fontSize: 14.0,
            fontWeight: FontWeight.normal,
            color: MyColors.secondary)),
    bodySmall: GoogleFonts.robotoCondensed(
        textStyle: const TextStyle().copyWith(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            color: MyColors.secondary)),
    labelLarge: GoogleFonts.robotoCondensed(
        textStyle: const TextStyle().copyWith(
            fontSize: 12.0,
            fontWeight: FontWeight.normal,
            color: MyColors.secondary)),
    labelMedium: GoogleFonts.robotoCondensed(
        textStyle: const TextStyle().copyWith(
            fontSize: 12.0,
            fontWeight: FontWeight.normal,
            color: MyColors.secondary)),
  );

  ///controlls the darkTexttheme
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: GoogleFonts.lobster(
        textStyle: const TextStyle().copyWith(
            fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.white)),
    headlineMedium: GoogleFonts.lobster(
        textStyle: const TextStyle().copyWith(
            fontSize: 20.0, fontWeight: FontWeight.w600, color: Colors.white)),
    headlineSmall: GoogleFonts.lobster(
        textStyle: const TextStyle().copyWith(
            fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.white)),
    titleLarge: GoogleFonts.lobster(
        textStyle: const TextStyle().copyWith(
            fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.white)),
    titleMedium: GoogleFonts.robotoCondensed(
        textStyle: const TextStyle().copyWith(
            fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.white)),
    titleSmall: GoogleFonts.robotoCondensed(
        textStyle: const TextStyle().copyWith(
            fontSize: 16.0, fontWeight: FontWeight.w400, color: Colors.white)),
    bodyLarge: GoogleFonts.robotoCondensed(
        textStyle: const TextStyle().copyWith(
            fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.white)),
    bodyMedium: GoogleFonts.robotoCondensed(
        textStyle: const TextStyle().copyWith(
            fontSize: 14.0,
            fontWeight: FontWeight.normal,
            color: Colors.white)),
    bodySmall: GoogleFonts.robotoCondensed(
        textStyle: const TextStyle().copyWith(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            color: Colors.white)),
    labelLarge: GoogleFonts.robotoCondensed(
        textStyle: const TextStyle().copyWith(
            fontSize: 12.0,
            fontWeight: FontWeight.normal,
            color: Colors.white)),
    labelMedium: GoogleFonts.robotoCondensed(
        textStyle: const TextStyle().copyWith(
            fontSize: 12.0,
            fontWeight: FontWeight.normal,
            color: Colors.white)),
  );
}
