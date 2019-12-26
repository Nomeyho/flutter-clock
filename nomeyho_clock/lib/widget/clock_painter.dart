import 'dart:math' as math;

import 'package:flutter/material.dart';

/// [CustomPainter] that draws a clock background.
class ClockPainter extends CustomPainter {

  ClockPainter({
    @required Color backgroundColor,
    @required Color borderColor,
    @required double borderLineWidth,
    @required this.hourTickMarkLength,
    @required Color hourTickMarkColor,
    @required double hourTickMarkWidth,
    @required this.minuteTickMarkLength,
    @required Color minuteTickColor,
    @required double minuteTickMarkWidth,
  })  : assert(backgroundColor != null),
        backgroundPaint = Paint()..color = backgroundColor,

        /// Border
        assert(borderColor != null),
        assert(borderLineWidth != null),
        assert(borderLineWidth > 0),
        borderPaint = Paint()
          ..color = borderColor
          ..strokeWidth = borderLineWidth
          ..style = PaintingStyle.stroke,

        /// Hour tick
        assert(hourTickMarkLength != null),
        assert(hourTickMarkLength > 0),
        assert(hourTickMarkColor != null),
        assert(hourTickMarkWidth != null),
        assert(hourTickMarkWidth > 0),
        hourTickMarkPaint = Paint()
          ..color = hourTickMarkColor
          ..strokeWidth = hourTickMarkWidth
          ..style = PaintingStyle.stroke,

        /// Minute tick
        assert(minuteTickMarkLength != null),
        assert(minuteTickMarkLength > 0),
        assert(minuteTickColor != null),
        assert(minuteTickMarkWidth != null),
        assert(minuteTickMarkWidth > 0),
        minuteTickPaint = Paint()
          ..color = minuteTickColor
          ..strokeWidth = minuteTickMarkWidth
          ..style = PaintingStyle.stroke;

  final Paint backgroundPaint;
  final Paint borderPaint;
  final double hourTickMarkLength;
  final Paint hourTickMarkPaint;
  final double minuteTickMarkLength;
  final Paint minuteTickPaint;

  /// As a percentage of the parent width
  static const double outerBorderRadius = 0.95;
  static const double innerBorderRadius = 0.8;

  void _paintOuterShadow(Canvas canvas, Offset offset, double outerRadius) {
    final rect = Rect.fromCircle(center: offset, radius: outerRadius);
    final path = Path()..addArc(rect, 0, 2 * math.pi);
    canvas.drawShadow(path, Colors.black, 5, true);
  }

  void _paintInnerShadow(Canvas canvas, Offset offset, double innerRadius) {
    final rect = Rect.fromCircle(center: offset, radius: innerRadius * 1.1);
    final path = Path()..addArc(rect, 0, 2 * math.pi);
    canvas.drawShadow(path, Colors.transparent, 2, true);
  }

  void _paintBorders(Canvas canvas, Size size) {
    final center = (Offset.zero & size).center;
    final outerRadius = (size.shortestSide / 2) * outerBorderRadius;
    final innerRadius = (size.shortestSide / 2) * innerBorderRadius;

   _paintOuterShadow(canvas, center.translate(0, 0), outerRadius);
   canvas.drawCircle(center, outerRadius, backgroundPaint);
   _paintInnerShadow(canvas, center.translate(0, 0), innerRadius);
   canvas.drawCircle(center, outerRadius, borderPaint);
   // canvas.drawCircle(center, innerRadius, borderPaint);
  }

  void _paintTickMarks(Canvas canvas, Size size) {
    final center = (Offset.zero & size).center;
    canvas.translate(center.dx, center.dy);

    final radius = (size.width / 2) * innerBorderRadius;
    final angleIncrement = 2 * math.pi / 60;
    final startOffset = Offset(0.0, -radius);
    final endHourOffset = Offset(0.0, -radius + hourTickMarkLength);
    final endMinuteOffset = Offset(0.0, -radius + minuteTickMarkLength);

    for (var i = 0; i < 60; ++i) {
      if (i % 5 == 0) {
        /// hour
        canvas.drawLine(startOffset, endHourOffset, hourTickMarkPaint);
      } else {
        /// minute
        // canvas.drawLine(startOffset, endMinuteOffset, minuteTickPaint);
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
    return oldDelegate.backgroundPaint != backgroundPaint ||
        oldDelegate.borderPaint != borderPaint ||
        oldDelegate.hourTickMarkLength != hourTickMarkLength ||
        oldDelegate.hourTickMarkPaint != hourTickMarkPaint ||
        oldDelegate.minuteTickMarkLength != minuteTickMarkLength ||
        oldDelegate.minuteTickMarkLength != minuteTickMarkLength;
  }
}
