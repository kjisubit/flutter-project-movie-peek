import 'dart:math';

import 'package:flutter/material.dart';

class DonutChartPainter extends CustomPainter {
  final double progress;
  final String displayText;

  DonutChartPainter({required this.progress, required this.displayText});

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 4;
    final center = size.center(Offset.zero);

    final paint =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 10;

    // 배경 원
    paint.color = Colors.white.withAlpha((255 * 0.2).toInt());
    canvas.drawCircle(center, radius, paint);

    // 진행 아크
    paint.color = Colors.blueAccent;
    final sweepAngle = progress * 2 * pi;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      sweepAngle,
      false,
      paint,
    );

    // 텍스트
    final textSpan = TextSpan(
      text: displayText,
      style: TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );

    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );

    textPainter.layout();
    final offset = Offset(
      center.dx - textPainter.width / 2,
      center.dy - textPainter.height / 2,
    );
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant DonutChartPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.displayText != displayText;
  }
}
