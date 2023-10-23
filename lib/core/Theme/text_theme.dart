import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextTheme {
  static TextTheme customDarkTextTheme = TextTheme(
    displayLarge: GoogleFonts.poppins(
      color: const Color(0xFF97CBFF),
      fontSize: 50.0,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
      wordSpacing: 0,
    ),
    displayMedium: GoogleFonts.poppins(
        color: const Color.fromARGB(255, 172, 214, 255),
        fontSize: 30.0,
        fontWeight: FontWeight.w500,
        letterSpacing: 0,
        wordSpacing: 0),
    displaySmall: GoogleFonts.roboto(
      color: const Color.fromARGB(255, 140, 201, 255),
      fontSize: 36.0,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.0,
    ),
    headlineMedium: GoogleFonts.roboto(
      color: Colors.white,
      fontSize: 32.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.0,
    ),
    headlineSmall: GoogleFonts.roboto(
      color: Colors.white,
      fontSize: 24.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.0,
    ),
    titleLarge: GoogleFonts.roboto(
      color: Colors.white,
      fontSize: 22.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.0,
    ),
    titleMedium: GoogleFonts.poppins(
      color: Colors.white,
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
    ),
    titleSmall: GoogleFonts.roboto(
      color: Colors.white,
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
    ),
    bodyLarge: GoogleFonts.roboto(
      color: Colors.white,
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
    ),
    bodyMedium: GoogleFonts.roboto(
      fontSize: 12.0,
      color: Colors.white,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
    ),
    bodySmall: GoogleFonts.roboto(
      color: Colors.white,
      fontSize: 11.0,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
    ),
    labelLarge: GoogleFonts.roboto(
      color: Colors.white,
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
    ),
    labelSmall: GoogleFonts.roboto(
      color: Colors.white,
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
    ),
  );
  static TextTheme customLightTextTheme = TextTheme(
    displayLarge: GoogleFonts.roboto(
      color: Colors.black,
      fontSize: 57.0,
      fontWeight: FontWeight.w400,
      letterSpacing: -0.25,
    ),
    displayMedium: GoogleFonts.roboto(
      color: Colors.black,
      fontSize: 45.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.0,
    ),
    displaySmall: GoogleFonts.roboto(
      color: Colors.black,
      fontSize: 36.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.0,
    ),
    headlineMedium: GoogleFonts.roboto(
      color: Colors.black,
      fontSize: 19.0,
      fontWeight: FontWeight.w700,
      height: 0.06,
      letterSpacing: 0.10,
    ),
    headlineSmall: GoogleFonts.roboto(
      color: Colors.black,
      fontSize: 24.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.0,
    ),
    titleLarge: GoogleFonts.roboto(
      color: Colors.white,
      fontSize: 22.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.0,
    ),
    titleMedium: GoogleFonts.roboto(
      color: Colors.white,
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
    ),
    titleSmall: GoogleFonts.roboto(
      color: Colors.black,
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      height: 0.10,
      letterSpacing: 0.10,
    ),
    bodyLarge: GoogleFonts.roboto(
      color: Colors.white,
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
    ),
    bodyMedium: GoogleFonts.roboto(
      fontSize: 12.0,
      color: Colors.white,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
    ),
    bodySmall: GoogleFonts.roboto(
      color: Colors.white,
      fontSize: 11.0,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
    ),
    labelLarge: GoogleFonts.roboto(
      color: Colors.white,
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
    ),
    labelSmall: GoogleFonts.roboto(
      color: Colors.white,
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
    ),
  );

  // static ThemeData dark() {
  //   return ThemeData(
  //     brightness: Brightness.dark,
  //     appBarTheme: AppBarTheme(
  //       foregroundColor: Colors.white,
  //       backgroundColor: Colors.grey[900],
  //     ),
  //     floatingActionButtonTheme: const FloatingActionButtonThemeData(
  //       foregroundColor: Colors.white,
  //       backgroundColor: Colors.green,
  //     ),
  //     bottomNavigationBarTheme: const BottomNavigationBarThemeData(
  //       selectedItemColor: Colors.green,
  //     ),
  //     textTheme: darkTextTheme,
  //   );
  // }
}
