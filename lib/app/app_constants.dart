import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppConstants {
  AppConstants._();

  static const ColorScheme lightScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF0072BB),
    onPrimary: Colors.white,
    secondary: Colors.blueGrey,
    error: Color(0xFFB00020),
    onError: Colors.white,
    surface: Colors.white,
    onSurface: Colors.black,
    onSecondary: Colors.white,
  );

  static const darkScheme = ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFF004C8C),
      onPrimary: Colors.white,
      secondary: Color(0xFF03DAC6),
      onSecondary: Color(0xFF03DAC6),
      error: Color(0xFFCF6679),
      onError: Colors.white,
      surface: Color(0xFF1E1E1E),
      onSurface: Colors.white);

  static ThemeData lightTheme = ThemeData(
    colorScheme: lightScheme,
    scaffoldBackgroundColor: Colors.grey.shade100,
    textTheme: GoogleFonts.robotoTextTheme(),
  );
  static ThemeData darkTheme = ThemeData(
    colorScheme: darkScheme,
    scaffoldBackgroundColor: const Color(0xFF383838),
    textTheme: GoogleFonts.robotoTextTheme().apply(
      bodyColor: Colors.white,
      displayColor: Colors.white,
    ),
  );

  static const themeKey = "theme_mode";
  static const animeFeedStyleKey = "anime_feed_mode";
}
