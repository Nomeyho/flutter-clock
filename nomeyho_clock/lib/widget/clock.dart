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
          color: Colors.black,
          thickness: 4,
          size: 0.8,
          angleRadians: time.minutes * radiansPerTick,
        ),
        Hand(
          color: Colors.black,
          thickness: 4,
          size: 0.8,
          angleRadians: time.hours * radiansPerHour,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: new Border.all(
              width: 0.0,
              color: Colors.grey,
            ),
            color: Colors.transparent,
            boxShadow: [
              const BoxShadow(
                color: Colors.grey,
                offset: const Offset(0.0, 0.0),
              ),
              const BoxShadow(
                color: Colors.white,
                offset: const Offset(-0.5, -0.5),
                spreadRadius: -0.5,
                blurRadius: 1.0,
              ),
            ]),
        child: _drawHands(),
      ),
    );
  }
}
