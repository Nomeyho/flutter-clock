import 'dart:math' as math;

import 'package:flutter/material.dart';

/// [CustomPainter] that draws a clock hand.
class HandPainter extends CustomPainter {
  HandPainter({
    @required this.handSize,
    @required this.lineWidth,
    @required this.angleRadians,
    @required this.color,
    @required this.centerColor,
  })  : assert(handSize != null),
        assert(lineWidth != null),
        assert(angleRadians != null),
        assert(color != null),
        assert(handSize >= 0.0),
        assert(handSize <= 1.0),
        assert(centerColor != null);

  final double handSize;
  final double lineWidth;
  final double angleRadians;
  final Color color;
  final Color centerColor;

  get handPaint => Paint()
    ..color = color
    ..strokeWidth = lineWidth
    ..strokeCap = StrokeCap.round;

  get centerPaint => Paint()..color = centerColor;

  @override
  void paint(Canvas canvas, Size size) {
    final center = (Offset.zero & size).center;
    // We want to start at the top, not at the x-axis, so add pi/2.
    final angle = angleRadians - math.pi / 2.0;
    final length = size.shortestSide * 0.5 * handSize;
    final position = center + Offset(math.cos(angle), math.sin(angle)) * length;

    canvas.drawLine(center, position, handPaint);
    canvas.drawCircle(center, lineWidth / 3, centerPaint);
  }

  @override
  bool shouldRepaint(HandPainter oldDelegate) {
    return oldDelegate.handSize != handSize ||
        oldDelegate.lineWidth != lineWidth ||
        oldDelegate.angleRadians != angleRadians ||
        oldDelegate.color != color ||
        oldDelegate.centerColor != centerColor;
  }
}
