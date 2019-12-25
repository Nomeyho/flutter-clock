import 'package:flutter/material.dart';
import 'package:nomeyho_clock/model/time.dart';
import 'package:nomeyho_clock/widget/hand.dart';
import 'package:vector_math/vector_math_64.dart' show radians;

final radiansPerTick = radians(360 / 60);
final radiansPerHour = radians(360 / 12);

class Clock extends StatefulWidget {
  /// Animates the clock from [previousTime] to [time].
  final Time previousTime;
  final Time time;

  Clock({
    @required this.previousTime,
    @required this.time,
  });

  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> with SingleTickerProviderStateMixin {
  Animation<double> _minuteAnimation;
  Animation<double> _hourAnimation;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _minuteAnimation = Tween<double>(
      begin: widget.previousTime.minutes,
      end: widget.time.minutes,
    ).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _hourAnimation = Tween<double>(
      begin: widget.previousTime.hours,
      end: widget.time.hours,
    ).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.forward();
  }

  @override
  void didUpdateWidget(Clock oldWidget) {
    if(this.widget.time == oldWidget.time) {
      return;
    }

    /// Triggers the animation when [time] changes
    _controller.reset();
    _minuteAnimation = Tween<double>(
      begin: widget.previousTime.minutes,
      end: widget.time.minutes,
    ).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _hourAnimation = Tween<double>(
      begin: widget.previousTime.hours,
      end: widget.time.hours,
    ).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.forward();
    super.didUpdateWidget(oldWidget);
  }

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
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, index) {
          return Stack(
            children: <Widget>[
              Hand(
                color: Colors.black,
                thickness: 4,
                size: 0.8,
                angleRadians: _minuteAnimation.value * radiansPerTick,
              ),
              Hand(
                color: Colors.black,
                thickness: 4,
                size: 0.8,
                angleRadians: _hourAnimation.value * radiansPerHour,
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
