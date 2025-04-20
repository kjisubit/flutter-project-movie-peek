import 'package:flutter/material.dart';
import 'package:movie_peek/theme/custom_theme_colors.dart';

class MovieSurface extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final BorderRadius borderRadius;
  final EdgeInsets padding;

  const MovieSurface({
    super.key,
    required this.child,
    this.onTap,
    this.borderRadius = BorderRadius.zero,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CustomThemeColors>()!;
    const splashOpacity = 0.2;

    return Material(
      color: colors.surface,
      borderRadius: borderRadius,
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius,
        splashColor: colors.onBackgroundActive.withAlpha((255 * splashOpacity).toInt()),
        highlightColor: Colors.transparent,
        child: Padding(padding: padding, child: child),
      ),
    );
  }
}
