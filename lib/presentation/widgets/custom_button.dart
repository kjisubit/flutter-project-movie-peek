import 'package:flutter/material.dart';
import 'package:movie_peek/theme/custom_theme_colors.dart';

import 'movie_surface.dart';

class MoviePeekButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final double radius;
  final Color? backgroundColor;
  final Color? contentColor;

  const MoviePeekButton({
    super.key,
    required this.child,
    this.onPressed,
    this.radius = 8.0,
    this.backgroundColor,
    this.contentColor,
  });

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomThemeColors>()!;

    return MovieSurface(
      onTap: onPressed,
      backgroundColor: backgroundColor ?? customColors.primary,
      borderRadius: BorderRadius.circular(radius),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: DefaultTextStyle.merge(
          style: TextStyle(
            color: contentColor ?? customColors.onPrimary,
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
          child: child,
        ),
      ),
    );
  }
}
