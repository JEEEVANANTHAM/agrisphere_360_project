import 'package:flutter/material.dart';

class AppTheme {
  static const primaryGreen = Color(0xFF2E7D32);
  static const secondaryGreen = Color(0xFF4CAF50);
  static const lightGreen = Color(0xFFE8F5E9);
  static const darkGreen = Color(0xFF1B5E20);
  static const accentOrange = Color(0xFFFF9800);
  static const backgroundGrey = Color(0xFFF5F5F5);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryGreen,
        primary: primaryGreen,
        secondary: secondaryGreen,
        surface: Colors.white,
        background: backgroundGrey,
        brightness: Brightness.light,
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontFamily: 'Outfit',
          fontWeight: FontWeight.bold,
          fontSize: 32,
          color: darkGreen,
        ),
        headlineMedium: TextStyle(
          fontFamily: 'Outfit',
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: darkGreen,
        ),
        bodyLarge: TextStyle(
          fontFamily: 'Outfit',
          fontSize: 16,
          color: Colors.black87,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryGreen,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 2,
        ),
      ),
      cardTheme: CardTheme(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.grey.shade200),
        ),
        color: Colors.white,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryGreen,
        primary: secondaryGreen,
        secondary: primaryGreen,
        surface: const Color(0xFF121212),
        background: Colors.black,
        brightness: Brightness.dark,
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontFamily: 'Outfit',
          fontWeight: FontWeight.bold,
          fontSize: 32,
          color: Colors.white,
        ),
        headlineMedium: TextStyle(
          fontFamily: 'Outfit',
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: Colors.white,
        ),
      ),
    );
  }
}
