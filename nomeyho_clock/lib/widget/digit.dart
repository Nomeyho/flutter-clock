import 'package:flutter/material.dart';
import 'package:nomeyho_clock/utils/digit_to_time.dart';
import 'package:nomeyho_clock/utils/zip.dart';
import 'package:nomeyho_clock/widget/clock.dart';

class Digit extends StatelessWidget {
  final int digit;

  Digit({
    @required this.digit,
  }) : assert(digit >= 0 && digit <= 9);

  _buildClocks() {
    final previousTimes = getTimesForDigit(digit - 1);
    final times = getTimesForDigit(digit);

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
