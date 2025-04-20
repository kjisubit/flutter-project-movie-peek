import 'package:flutter/material.dart';

import 'custom_theme_colors.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: LightPalette.background,
  extensions: [lightCustomThemeColors],
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: LightPalette.textPrimary),
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: DarkPalette.background,
  extensions: [darkCustomThemeColors],
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: DarkPalette.textPrimary),
  ),
);

class LightPalette {
  static const Color background = Color(0xFFF9FAFB);
  static const Color onBackgroundActive = Color(0xFF202124);
  static const Color onBackgroundInactive = Color(0xFFB0B3B8);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color primary = Color(0xFF1A73E8);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color secondary = Color(0xFF34A853);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color error = Color(0xFFEA4335);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color textPrimary = Color(0xFF202124);
  static const Color textSecondary = Color(0xFF5F6368);
  static const Color border = Color(0xFFDDDFE2);
}

class DarkPalette {
  static const Color background = Color(0xFF121212);
  static const Color onBackgroundActive = Color(0xFFE8EAED);
  static const Color onBackgroundInactive = Color(0xFF80868B);
  static const Color surface = Color(0xFF1E1E1E);
  static const Color primary = Color(0xFF8AB4F8);
  static const Color onPrimary = Color(0xFF000000);
  static const Color secondary = Color(0xFF81C995);
  static const Color onSecondary = Color(0xFF000000);
  static const Color error = Color(0xFFCF6679);
  static const Color onError = Color(0xFF000000);
  static const Color textPrimary = Color(0xFFE8EAED);
  static const Color textSecondary = Color(0xFF9AA0A6);
  static const Color border = Color(0xFF3C4043);
}

final lightCustomThemeColors = const CustomThemeColors(
  background: LightPalette.background,
  onBackgroundActive: LightPalette.onBackgroundActive,
  onBackgroundInactive: LightPalette.onBackgroundInactive,
  surface: LightPalette.surface,
  primary: LightPalette.primary,
  onPrimary: LightPalette.onPrimary,
  secondary: LightPalette.secondary,
  onSecondary: LightPalette.onSecondary,
  error: LightPalette.error,
  onError: LightPalette.onError,
  textPrimary: LightPalette.textPrimary,
  textSecondary: LightPalette.textSecondary,
  border: LightPalette.border,
);

final darkCustomThemeColors = const CustomThemeColors(
  background: DarkPalette.background,
  onBackgroundActive: LightPalette.onBackgroundActive,
  onBackgroundInactive: LightPalette.onBackgroundInactive,
  surface: DarkPalette.surface,
  primary: DarkPalette.primary,
  onPrimary: DarkPalette.onPrimary,
  secondary: DarkPalette.secondary,
  onSecondary: DarkPalette.onSecondary,
  error: DarkPalette.error,
  onError: DarkPalette.onError,
  textPrimary: DarkPalette.textPrimary,
  textSecondary: DarkPalette.textSecondary,
  border: DarkPalette.border,
);
