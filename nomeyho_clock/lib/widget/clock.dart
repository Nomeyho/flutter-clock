import 'package:flutter/material.dart';
import 'package:nomeyho_clock/widget/clock_painter.dart';
import 'package:nomeyho_clock/widget/hand.dart';
import 'package:vector_math/vector_math_64.dart' show radians;

final radiansPerTick = radians(360 / 60);
final radiansPerHour = radians(360 / 12);

class Clock extends StatelessWidget {
  final Animation<double> minuteAnimation;
  final Animation<double> hourAnimation;

  Clock({
    @required this.minuteAnimation,
    @required this.hourAnimation,
  });

  Widget _buildMinuteHand() {
    return AnimatedBuilder(
      animation: minuteAnimation,
      builder: (context, index) {
        return Hand(
          color: Colors.black,
          thickness: 4,
          size: 0.75,
          angleRadians: minuteAnimation.value * radiansPerTick,
        );
      },
    );
  }

  Widget _buildHourHand() {
    return AnimatedBuilder(
      animation: hourAnimation,
      builder: (context, index) {
        return Hand(
          color: Colors.black,
          thickness: 4,
          size: 0.75,
          angleRadians: hourAnimation.value * radiansPerHour,
        );
      },
    );
  }

  Widget _buildBackground() {
    return Center(
      child: SizedBox.expand(
        child: CustomPaint(
          painter: ClockPainter(
            backgroundColor: Colors.white,
            borderColor: Colors.grey,
            borderLineWidth: 1,
            hourTickMarkLength: 6,
            hourTickMarkColor: Colors.black,
            hourTickMarkWidth: 1.5,
            minuteTickMarkLength: 3,
            minuteTickColor: Colors.grey,
            minuteTickMarkWidth: 1,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _buildBackground(),
        _buildMinuteHand(),
        _buildHourHand(),
      ],
    );
  }
}
