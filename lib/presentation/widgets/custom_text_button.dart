import 'package:flutter/material.dart';
import 'package:movie_peek/theme/custom_theme_colors.dart';

import 'movie_surface.dart';

class CustomTextButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final double radius;  // 추가된 radius 변수

  const CustomTextButton({
    super.key,
    required this.label,
    this.onPressed,
    this.radius = 8.0,  // 기본값 8.0으로 설정
  });

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomThemeColors>()!;

    return MovieSurface(
      onTap: onPressed,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: customColors.primary,
          foregroundColor: customColors.onPrimary,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),  // radius 적용
        ),
        child: Text(
          label,
          style: TextStyle(
            color: customColors.onPrimary,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
