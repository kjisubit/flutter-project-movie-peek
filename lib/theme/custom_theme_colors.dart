import 'package:flutter/material.dart';

class CustomThemeColors extends ThemeExtension<CustomThemeColors> {
  final Color background;
  final Color onBackgroundActive;
  final Color onBackgroundInactive;
  final Color surface;
  final Color primary;
  final Color onPrimary;
  final Color secondary;
  final Color onSecondary;
  final Color error;
  final Color onError;
  final Color textPrimary;
  final Color textSecondary;
  final Color border;

  const CustomThemeColors({
    required this.background,
    required this.onBackgroundActive,
    required this.onBackgroundInactive,
    required this.surface,
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
    required this.error,
    required this.onError,
    required this.textPrimary,
    required this.textSecondary,
    required this.border,
  });

  @override
  CustomThemeColors copyWith({
    Color? background,
    Color? onBackgroundActive,
    Color? onBackgroundInactive,
    Color? surface,
    Color? primary,
    Color? onPrimary,
    Color? secondary,
    Color? onSecondary,
    Color? error,
    Color? onError,
    Color? textPrimary,
    Color? textSecondary,
    Color? border,
    Color? inactive,
  }) {
    return CustomThemeColors(
      background: background ?? this.background,
      onBackgroundActive: onBackgroundActive ?? this.onBackgroundActive,
      onBackgroundInactive: onBackgroundInactive ?? this.onBackgroundInactive,
      surface: surface ?? this.surface,
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      secondary: secondary ?? this.secondary,
      onSecondary: onSecondary ?? this.onSecondary,
      error: error ?? this.error,
      onError: onError ?? this.onError,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      border: border ?? this.border,
    );
  }

  @override
  CustomThemeColors lerp(ThemeExtension<CustomThemeColors>? other, double t) {
    if (other is! CustomThemeColors) return this;
    return CustomThemeColors(
      background: Color.lerp(background, other.background, t)!,
      onBackgroundActive: Color.lerp(onBackgroundActive, other.onBackgroundActive, t)!,
      onBackgroundInactive: Color.lerp(onBackgroundInactive, other.onBackgroundInactive, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      onSecondary: Color.lerp(onSecondary, other.onSecondary, t)!,
      error: Color.lerp(error, other.error, t)!,
      onError: Color.lerp(onError, other.onError, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      border: Color.lerp(border, other.border, t)!,
    );
  }
}
