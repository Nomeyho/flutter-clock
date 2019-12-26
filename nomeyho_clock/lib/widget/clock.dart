import 'package:flutter/material.dart';
import 'package:nomeyho_clock/nomeyho_theme.dart';
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
          size: 0.60,
          thickness: 4,
          angleRadians: minuteAnimation.value * radiansPerTick,
          color: NomeyhoTheme.of(context).accent_700,
          centerColor: NomeyhoTheme.of(context).primary_700,
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
          thickness: 4,
          angleRadians: hourAnimation.value * radiansPerHour,
          color: NomeyhoTheme.of(context).accent_700,
          centerColor: NomeyhoTheme.of(context).primary_700,
        );
      },
    );
  }

  Widget _buildClock(BuildContext context) {
    return Center(
      child: SizedBox.expand(
        child: CustomPaint(
          painter: ClockPainter(
            backgroundColor: Colors.white.withAlpha(20),
            borderColor: NomeyhoTheme.of(context).primary_700,
            borderLineWidth: 1,
            hourTickMarkLength: 4,
            hourTickMarkColor: NomeyhoTheme.of(context).accent_700,
            hourTickMarkWidth: 1.5,
            minuteTickMarkLength: 2,
            minuteTickColor: NomeyhoTheme.of(context).primary_700,

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
        _buildClock(context),
        _buildMinuteHand(),
        _buildHourHand(),
      ],
    );
  }
}
