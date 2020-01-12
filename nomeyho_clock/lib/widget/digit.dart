import 'package:flutter/material.dart';
import 'package:nomeyho_clock/utils/digit_to_time.dart';
import 'package:nomeyho_clock/widget/clock.dart';

class Digit extends StatefulWidget {
  final int digit;
  final Color color;
  final Color clockColor;
  final double thickness;
  final int animationDuration;

  Digit({
    @required this.digit,
    @required this.color,
    @required this.clockColor,
    @required this.thickness,
    @required this.animationDuration,
  })  : assert(digit != null),
        assert(digit >= 0 && digit <= 9),
        assert(color != null),
        assert(clockColor != null),
        assert(thickness != null),
        assert(animationDuration != null);

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
      duration: Duration(milliseconds: widget.animationDuration),
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

  get _curveAnimation => CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutExpo,
      );

  Animation<double> _getMinuteAnimation(previousTime, time) {
    final previousMinutes = previousTime.minutes;
    final minutes = time.minutes;

    return Tween<double>(
      begin: previousMinutes,
      end: previousMinutes > minutes ? minutes + 60 : minutes, // clockwise
    ).animate(_curveAnimation);
  }

  Animation<double> _getHourAnimation(previousTime, time) {
    final previousHours = previousTime.hours;
    final hours = time.hours;

    return Tween<double>(
      begin: previousHours,
      end: previousHours > hours ? hours + 12 : hours, // clockwise
    ).animate(_curveAnimation);
  }

  /// Improve the readability of the digit by making the "disabled" clock
  /// disappear (opacity = 0).
  Animation<Color> _getHandOpacityAnimation(previousTime, time) {
    return ColorTween(
      begin: widget.color.withOpacity(1),
      end: widget.color.withOpacity(time.disabled ? 0 : 1),
    ).animate(_curveAnimation);
  }

  Clock _buildClock(previousTime, time) {
    return Clock(
      minuteAnimation: _getMinuteAnimation(previousTime, time),
      hourAnimation: _getHourAnimation(previousTime, time),
      handColorAnimation: _getHandOpacityAnimation(previousTime, time),
      clockColor: widget.clockColor,
      thickness: widget.thickness,
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
