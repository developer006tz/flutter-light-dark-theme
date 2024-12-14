import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_provider.g.dart';

/// Theme mode state notifier
@Riverpod(keepAlive: true)
class ThemeModeNotifier extends _$ThemeModeNotifier {
  static const _themePreferenceKey = 'theme_mode';

  @override
  Future<ThemeMode> build() async {
    final prefs = await SharedPreferences.getInstance();
    final savedTheme = prefs.getString(_themePreferenceKey);
    
    return switch (savedTheme) {
      'light' => ThemeMode.light,
      'dark' => ThemeMode.dark,
      _ => ThemeMode.system,
    };
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    
    switch (mode) {
      case ThemeMode.light:
        await prefs.setString(_themePreferenceKey, 'light');
        break;
      case ThemeMode.dark:
        await prefs.setString(_themePreferenceKey, 'dark');
        break;
      case ThemeMode.system:
        await prefs.setString(_themePreferenceKey, 'system');
        break;
    }
    
    state = AsyncData(mode);
  }
}