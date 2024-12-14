import 'package:flutter/material.dart';

class AppTypography {
  static const _fontFamily = 'Inter';

  static TextTheme get textTheme => const TextTheme(
    displayLarge: TextStyle(
      fontSize: 57,
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w400,
    ),
    displayMedium: TextStyle(
      fontSize: 45,
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w400,
    ),
    displaySmall: TextStyle(
      fontSize: 36,
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w400,
    ),
    headlineLarge: TextStyle(
      fontSize: 32,
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w600,
    ),
    headlineMedium: TextStyle(
      fontSize: 28,
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: TextStyle(
      fontSize: 24,
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w600,
    ),
    titleLarge: TextStyle(
      fontSize: 22,
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w500,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w500,
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w400,
    ),
  );
}