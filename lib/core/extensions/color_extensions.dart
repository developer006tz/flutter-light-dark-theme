import 'package:flutter/material.dart';

extension ColorExtension on Color {
  String get colorHexString {
    // Convert each color component from 0-1 scale to 0-255 scale
    // Then convert to hexadecimal and ensure 2 digits with padLeft
    final red = (r * 255).toInt().toRadixString(16).padLeft(2, '0');
    final green = (g * 255).toInt().toRadixString(16).padLeft(2, '0');
    final blue = (b * 255).toInt().toRadixString(16).padLeft(2, '0');
    final alpha = (a * 255).toInt().toRadixString(16).padLeft(2, '0');

    // Combine all components in ARGB format
    return '$alpha$red$green$blue';
  }

  String toHex({bool hashSign = false, bool withAlpha = false}) {
    // Similar conversion process but with more formatting options
    final alpha = (a * 255).toInt().toRadixString(16).padLeft(2, '0');
    final red = (r * 255).toInt().toRadixString(16).padLeft(2, '0');
    final green = (g * 255).toInt().toRadixString(16).padLeft(2, '0');
    final blue = (b * 255).toInt().toRadixString(16).padLeft(2, '0');

    // Build the hex string with optional hash sign and alpha
    return '${hashSign ? '#' : ''}'
            '${withAlpha ? alpha : ''}'
            '$red$green$blue'
        .toUpperCase();
  }
}