import 'package:flutter/material.dart';
import 'package:nomeyho_clock/model/time.dart';
import 'package:nomeyho_clock/utils/zip.dart';
import 'package:nomeyho_clock/widget/clock.dart';

class Digit extends StatelessWidget {
  final int digit;

  Digit({
    @required this.digit,
  }) : assert(digit >= 0 && digit <= 9);

  _buildClocks() {
    final previousTimes = digit > 0 ? _digitToTime[digit - 1] : _defaultTimes;
    final times = _digitToTime[digit];

    return zip([previousTimes, times])
        .map((t) => Clock(previousTime: t[0], time: t[1]))
        .toList(growable: false);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        children: _buildClocks(),
      ),
    );
  }
}

const _defaultTimes = [
  Time(hours: 7.5, minutes: 37.5),
  Time(hours: 7.5, minutes: 37.5),
  Time(hours: 7.5, minutes: 37.5),
  Time(hours: 7.5, minutes: 37.5),
  Time(hours: 7.5, minutes: 37.5),
  Time(hours: 7.5, minutes: 37.5)
];

const _digitToTime = [
  // 0
  [
    Time(hours: 6, minutes: 15),
    Time(hours: 9, minutes: 30),
    Time(hours: 6, minutes: 0),
    Time(hours: 0, minutes: 30),
    Time(hours: 3, minutes: 0),
    Time(hours: 0, minutes: 45),
  ],
  // 1
  [
    Time(hours: 7.5, minutes: 37.5),
    Time(hours: 6, minutes: 30),
    Time(hours: 7.5, minutes: 37.5),
    Time(hours: 6, minutes: 0),
    Time(hours: 7.5, minutes: 37.5),
    Time(hours: 0, minutes: 0)
  ],
  // 2
  [
    Time(hours: 3, minutes: 15),
    Time(hours: 9, minutes: 30),
    Time(hours: 6, minutes: 15),
    Time(hours: 0, minutes: 45),
    Time(hours: 0, minutes: 15),
    Time(hours: 9, minutes: 45)
  ],
  // 3
  [
    Time(hours: 3, minutes: 15),
    Time(hours: 9, minutes: 30),
    Time(hours: 3, minutes: 15),
    Time(hours: 9, minutes: 0),
    Time(hours: 3, minutes: 15),
    Time(hours: 9, minutes: 0)
  ],
  // 4
  [
    Time(hours: 6, minutes: 30),
    Time(hours: 6, minutes: 30),
    Time(hours: 0, minutes: 15),
    Time(hours: 6, minutes: 0),
    Time(hours: 7.5, minutes: 37.5),
    Time(hours: 0, minutes: 0)
  ],
  // 5
  [
    Time(hours: 6, minutes: 15),
    Time(hours: 9, minutes: 45),
    Time(hours: 0, minutes: 15),
    Time(hours: 6, minutes: 45),
    Time(hours: 3, minutes: 15),
    Time(hours: 0, minutes: 45)
  ],
  // 6
  [
    Time(hours: 6, minutes: 15),
    Time(hours: 9, minutes: 45),
    Time(hours: 6, minutes: 0),
    Time(hours: 6, minutes: 45),
    Time(hours: 0, minutes: 15),
    Time(hours: 0, minutes: 45)
  ],
  // 7
  [
    Time(hours: 3, minutes: 15),
    Time(hours: 6, minutes: 45),
    Time(hours: 7.5, minutes: 37.5),
    Time(hours: 6, minutes: 0),
    Time(hours: 7.5, minutes: 37.5),
    Time(hours: 0, minutes: 0)
  ],
  // 8
  [
    Time(hours: 6, minutes: 15),
    Time(hours: 6, minutes: 45),
    Time(hours: 0, minutes: 15),
    Time(hours: 0, minutes: 45),
    Time(hours: 0, minutes: 15),
    Time(hours: 0, minutes: 45)
  ],
  // 9
  [
    Time(hours: 6, minutes: 15),
    Time(hours: 6, minutes: 45),
    Time(hours: 3, minutes: 0),
    Time(hours: 6, minutes: 0),
    Time(hours: 3, minutes: 15),
    Time(hours: 0, minutes: 45)
  ],
];
