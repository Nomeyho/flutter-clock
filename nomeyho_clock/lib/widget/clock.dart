import 'package:flutter/material.dart';
import 'package:nomeyho_clock/widget/clock_painter.dart';
import 'package:nomeyho_clock/widget/hand.dart';
import 'package:vector_math/vector_math_64.dart' show radians;

final radiansPerTick = radians(360 / 60);
final radiansPerHour = radians(360 / 12);

class Clock extends StatelessWidget {
  final Animation<double> minuteAnimation;
  final Animation<double> hourAnimation;
  final Animation<Color> handColorAnimation;
  final Color clockColor;
  final double thickness;

  Clock({
    @required this.minuteAnimation,
    @required this.hourAnimation,
    @required this.handColorAnimation,
    @required this.clockColor,
    @required this.thickness,
  })  : assert(minuteAnimation != null),
        assert(hourAnimation != null),
        assert(handColorAnimation != null),
        assert(clockColor != null),
        assert(thickness != null);

  Widget _buildMinuteHand() {
    return AnimatedBuilder(
      animation: minuteAnimation,
      builder: (context, index) {
        return Hand(
          size: 0.60,
          thickness: thickness,
          angleRadians: minuteAnimation.value * radiansPerTick,
          color: handColorAnimation.value,
        );
      },
    );
  }

  Widget _buildHourHand() {
    return AnimatedBuilder(
      animation: hourAnimation,
      builder: (context, index) {
        return Hand(
          size: 0.60,
          thickness: thickness,
          angleRadians: hourAnimation.value * radiansPerHour,
          color: handColorAnimation.value,
        );
      },
    );
  }

  Widget _buildClock(BuildContext context) {
    return Center(
      child: SizedBox.expand(
        child: CustomPaint(
          painter: ClockPainter(
            borderColor: clockColor,
            borderLineWidth: 2,
            tickMarkLength: 4,
            tickMarkColor: clockColor,
            tickMarkWidth: 2,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _buildClock(context),
        _buildMinuteHand(),
        _buildHourHand(),
      ],
    );
  }
}
