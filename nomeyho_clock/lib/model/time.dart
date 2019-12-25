import 'package:flutter/material.dart';

class Time {
  final double hours;
  final double minutes;

  const Time({
    @required this.hours,
    @required this.minutes,
  })  : assert(hours >= 0 && hours <= 12),
        assert(minutes >= 0 && minutes <= 60);
}
