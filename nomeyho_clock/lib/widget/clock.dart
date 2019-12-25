import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 0.0,
          color: Colors.grey,
        ),
      ),
      child: Stack(
        children: <Widget>[
          AnimatedBuilder(
            animation: minuteAnimation,
            builder: (context, index) {
              return Hand(
                color: Colors.black,
                thickness: 4,
                size: 0.8,
                angleRadians: minuteAnimation.value * radiansPerTick,
              );
            },
          ),
          AnimatedBuilder(
            animation: hourAnimation,
            builder: (context, index) {
              return Hand(
                color: Colors.black,
                thickness: 4,
                size: 0.8,
                angleRadians: hourAnimation.value * radiansPerHour,
              );
            },
          ),
        ],
      ),
    );
  }
}
