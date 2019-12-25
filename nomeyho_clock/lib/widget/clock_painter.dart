import 'dart:math' as math;

import 'package:flutter/material.dart';

/// [CustomPainter] that draws a clock background.
class ClockPainter extends CustomPainter {
  // TODO @required vs assert(!= null)
  ClockPainter({
    @required Color borderColor,
    @required double borderLineWidth,
    @required this.hourTickMarkLength,
    @required Color hourTickMarkColor,
    @required double hourTickMarkWidth,
    @required this.minuteTickMarkLength,
    @required Color minuteTickColor,
    @required double minuteTickMarkWidth,
  })  :

        /// Border
        assert(borderLineWidth != null),
        assert(borderColor != null),
        borderPaint = Paint()
          ..color = borderColor
          ..strokeWidth = borderLineWidth
          ..style = PaintingStyle.stroke,

        /// Hour tick
        assert(hourTickMarkLength != null),
        assert(hourTickMarkColor != null),
        assert(hourTickMarkWidth != null),
        hourTickMarkPaint = Paint()
          ..color = hourTickMarkColor
          ..strokeWidth = hourTickMarkWidth
          ..style = PaintingStyle.stroke,

        /// Minute tick
        assert(minuteTickMarkLength != null),
        assert(minuteTickColor != null),
        assert(minuteTickMarkWidth != null),
        minuteTickPaint = Paint()
          ..color = minuteTickColor
          ..strokeWidth = minuteTickMarkWidth
          ..style = PaintingStyle.stroke;

  final Paint borderPaint;
  final double hourTickMarkLength;
  final Paint hourTickMarkPaint;
  final double minuteTickMarkLength;
  final Paint minuteTickPaint;

  /// As a percentage of the parent width
  static const double OUTER_BORDER_RADIUS = 0.9;
  static const double INNER_BORDER_RADIUS = 0.8;

  void _paintBorders(Canvas canvas, Size size) {
    final center = (Offset.zero & size).center;
    final outerRadius = (size.shortestSide / 2) * OUTER_BORDER_RADIUS;
    final innerRadius = (size.shortestSide / 2) * INNER_BORDER_RADIUS;

    canvas.drawCircle(center, outerRadius, borderPaint);
    canvas.drawCircle(center, innerRadius, borderPaint);
  }

  void _paintTickMarks(Canvas canvas, Size size) {
    final center = (Offset.zero & size).center;
    canvas.translate(center.dx, center.dy);

    final radius = (size.width / 2) * INNER_BORDER_RADIUS;
    final angleIncrement = 2 * math.pi / 60; // radians
    final startOffset = Offset(0.0, -radius);
    final endHourOffset = Offset(0.0, -radius + hourTickMarkLength);
    final endMinuteOffset = Offset(0.0, -radius + minuteTickMarkLength);

    for (var i = 0; i < 60; ++i) {
      if (i % 5 == 0) {
        /// hour
        canvas.drawLine(startOffset, endHourOffset, hourTickMarkPaint);
      } else {
        /// minute
        canvas.drawLine(startOffset, endMinuteOffset, minuteTickPaint);
      }
      canvas.rotate(angleIncrement);
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    _paintBorders(canvas, size);
    _paintTickMarks(canvas, size);
  }

  @override
  bool shouldRepaint(ClockPainter oldDelegate) {
    return oldDelegate.borderPaint != borderPaint ||
        oldDelegate.hourTickMarkLength != hourTickMarkLength ||
        oldDelegate.hourTickMarkPaint != hourTickMarkPaint ||
        oldDelegate.minuteTickMarkLength != minuteTickMarkLength ||
        oldDelegate.minuteTickMarkLength != minuteTickMarkLength;
  }
}
