import 'dart:math' as math;

import 'package:flutter/material.dart';

/// [CustomPainter] that draws a clock background.
class ClockPainter extends CustomPainter {
  ClockPainter({
    @required Color borderColor,
    @required double borderLineWidth,
    @required this.tickMarkLength,
    @required Color tickMarkColor,
    @required double tickMarkWidth,
  })  :

        /// Border
        assert(borderColor != null),
        assert(borderLineWidth != null),
        assert(borderLineWidth > 0),
        borderPaint = Paint()
          ..color = borderColor
          ..strokeWidth = borderLineWidth
          ..style = PaintingStyle.stroke,

        /// Hour tick
        assert(tickMarkLength != null),
        assert(tickMarkLength > 0),
        assert(tickMarkColor != null),
        assert(tickMarkWidth != null),
        assert(tickMarkWidth > 0),
        tickMarkPaint = Paint()
          ..color = tickMarkColor
          ..strokeWidth = tickMarkWidth
          ..style = PaintingStyle.stroke;

  final Paint borderPaint;
  final double tickMarkLength;
  final Paint tickMarkPaint;

  /// As a percentage of the parent width
  static const double padding = 0.05;

  void _paintBorder(Canvas canvas, Size size) {
    final center = (Offset.zero & size).center;
    final radius = (size.shortestSide / 2) * (1 - padding);

    canvas.drawCircle(center, radius, borderPaint);
  }

  void _paintTickMarks(Canvas canvas, Size size) {
    final center = (Offset.zero & size).center;
    canvas.translate(center.dx, center.dy);

    final radius = (size.width / 2) * (1 - 3 * padding);
    final angleIncrement = 2 * math.pi / 4;
    final startOffset = Offset(0.0, -radius);
    final endOffset = Offset(0.0, -radius + tickMarkLength);

    for (var i = 0; i < 4; ++i) {
      canvas.drawLine(startOffset, endOffset, tickMarkPaint);
      canvas.rotate(angleIncrement);
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    _paintBorder(canvas, size);
    _paintTickMarks(canvas, size);
  }

  @override
  bool shouldRepaint(ClockPainter oldDelegate) {
    return oldDelegate.borderPaint != borderPaint ||
        oldDelegate.tickMarkLength != tickMarkLength ||
        oldDelegate.tickMarkPaint != tickMarkPaint;
  }
}
