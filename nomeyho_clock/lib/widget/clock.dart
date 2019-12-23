import 'package:flutter/material.dart';
import 'package:nomeyho_clock/model/time.dart';
import 'package:nomeyho_clock/widget/hand.dart';
import 'package:vector_math/vector_math_64.dart' show radians;

final radiansPerTick = radians(360 / 60);
final radiansPerHour = radians(360 / 12);

class Clock extends StatelessWidget {
  final Time time;

  Clock({
    @required this.time,
  });

  Widget _drawHands() {
    return Stack(
      children: <Widget>[
        Hand(
          color: Colors.green,
          thickness: 4,
          size: 0.8,
          angleRadians: time.minutes * radiansPerTick,
        ),
        Hand(
          color: Colors.purple,
          thickness: 4,
          size: 0.8,
          angleRadians: time.hours * radiansPerHour,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: new Border.all(
          width: 1.0,
          color: Colors.red,
        ),
      ),
      child: time == null ? null : _drawHands(),
    );
  }
}
