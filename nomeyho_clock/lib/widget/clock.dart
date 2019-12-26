import 'package:flutter/material.dart';
import 'package:nomeyho_clock/widget/clock_painter.dart';
import 'package:nomeyho_clock/widget/hand.dart';
import 'package:vector_math/vector_math_64.dart' show radians;

final radiansPerTick = radians(360 / 60);
final radiansPerHour = radians(360 / 12);

class Clock extends StatelessWidget {
  final Animation<double> minuteAnimation;
  final Animation<double> hourAnimation;
  final Color handColor;
  final double thickness;

  Clock({
    @required this.minuteAnimation,
    @required this.hourAnimation,
    @required this.handColor,
    @required this.thickness,
  })  : assert(minuteAnimation != null),
        assert(hourAnimation != null),
        assert(handColor != null),
        assert(thickness != null);

  Widget _buildMinuteHand() {
    return AnimatedBuilder(
      animation: minuteAnimation,
      builder: (context, index) {
        return Hand(
          size: 0.60,
          thickness: thickness,
          angleRadians: minuteAnimation.value * radiansPerTick,
          color: handColor,
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
          color: handColor,
        );
      },
    );
  }

  Widget _buildClock(BuildContext context) {
    return Center(
      child: SizedBox.expand(
        child: CustomPaint(
          painter: ClockPainter(
            borderColor: Colors.white.withAlpha(10), // TODO quid light theme?
            borderLineWidth: 2,
            tickMarkLength: 4,
            tickMarkColor: Colors.white.withAlpha(10), // TODO
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
