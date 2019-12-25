import 'package:flutter/material.dart';
import 'package:nomeyho_clock/widget/hand_painter.dart';

class Hand extends StatelessWidget {
  /// Hand color.
  final Color color;

  /// Hand length, as a percentage of the smaller side of the clock's parent
  /// container.
  final double size;

  /// The angle, in radians, at which the hand is drawn.
  /// This angle is measured from the 12 o'clock position.
  final double angleRadians;

  /// How thick the hand should be drawn, in logical pixels.
  final double thickness;

  /// Rotation axis color
  final Color centerColor;

  const Hand({
    @required this.color,
    @required this.thickness,
    @required this.size,
    @required this.angleRadians,
    @required this.centerColor,
  })  : assert(color != null),
        assert(thickness != null),
        assert(size != null),
        assert(angleRadians != null),
        assert(centerColor != null);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.expand(
        child: CustomPaint(
          painter: HandPainter(
            handSize: size,
            lineWidth: thickness,
            angleRadians: angleRadians,
            color: color,
            centerColor: centerColor,
          ),
        ),
      ),
    );
  }
}
