import 'dart:math' as math;

import 'package:flutter/material.dart';

/// [CustomPainter] that draws a clock hand.
class HandPainter extends CustomPainter {
  HandPainter({
    @required this.handSize,
    @required this.lineWidth,
    @required this.angleRadians,
    @required this.color,
  })  : assert(handSize != null),
        assert(lineWidth != null),
        assert(angleRadians != null),
        assert(color != null),
        assert(handSize >= 0.0),
        assert(handSize <= 1.0);

  final double handSize;
  final double lineWidth;
  final double angleRadians;
  final Color color;

  handPaint(StrokeCap strokeCap) => Paint()
    ..color = color
    ..strokeWidth = lineWidth
    ..strokeCap = strokeCap;

  @override
  void paint(Canvas canvas, Size size) {
    final center = (Offset.zero & size).center;
    // We want to start at the top, not at the x-axis, so add pi/2.
    final angle = angleRadians - math.pi / 2.0;
    final length = size.shortestSide * 0.5 * handSize;
    final middle = center + Offset(math.cos(angle), math.sin(angle)) * length / 2;
    final end = center + Offset(math.cos(angle), math.sin(angle)) * length;

    canvas.drawLine(center, middle, handPaint(StrokeCap.round));
    canvas.drawLine(middle,  end, handPaint(StrokeCap.square));
  }

  @override
  bool shouldRepaint(HandPainter oldDelegate) {
    return oldDelegate.handSize != handSize ||
        oldDelegate.lineWidth != lineWidth ||
        oldDelegate.angleRadians != angleRadians ||
        oldDelegate.color != color;
  }
}
