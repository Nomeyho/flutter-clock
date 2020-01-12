import 'package:flutter/material.dart';

class Time {
  final double hours;
  final double minutes;

  const Time({
    @required this.hours,
    @required this.minutes,
  })  : assert(hours != null),
        assert(hours >= 0 && hours <= 12),
        assert(minutes != null),
        assert(minutes >= 0 && minutes <= 60);

  bool get disabled => hours == 7.5 && minutes == 37.5;
}
