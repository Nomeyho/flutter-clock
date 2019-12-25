import 'package:flutter/material.dart';
import 'package:nomeyho_clock/utils/digit_to_time.dart';
import 'package:nomeyho_clock/widget/clock.dart';

class Digit extends StatefulWidget {
  final int digit;

  Digit({
    @required this.digit,
  }) : assert(digit >= 0 && digit <= 9);

  /// Let 0 be the predecessor of 9.
  get previousDigit => digit == 0 ? 9 : (digit - 1);

  @override
  _DigitState createState() => _DigitState();
}

class _DigitState extends State<Digit> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _controller.forward();
  }

  @override
  void didUpdateWidget(Digit oldWidget) {
    /// Triggers the animation when [digit] changes
    if (oldWidget.digit != widget.digit) {
      _controller.reset();
      _controller.forward();
    }
    super.didUpdateWidget(oldWidget);
  }

  Animation<double> _getMinuteAnimation(previousTime, time) {
    return Tween<double>(
      begin: previousTime.minutes,
      end: time.minutes,
    ).animate(_controller);
  }

  Animation<double> _getHourAnimation(previousTime, time) {
    return Tween<double>(
      begin: previousTime.hours,
      end: time.hours,
    ).animate(_controller);
  }

  Clock _buildClock(previousTime, time) {
    return Clock(
      minuteAnimation: _getMinuteAnimation(previousTime, time),
      hourAnimation: _getHourAnimation(previousTime, time),
    );
  }

  List<Clock> _buildClocks() {
    final times = getTimesForDigit(widget.digit);
    final previousTimes = getTimesForDigit(widget.previousDigit);
    return List.generate(times.length, (i) => i)
        .map((i) => _buildClock(previousTimes[i], times[i]))
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
