import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Time extends Equatable {
  final double hours;
  final double minutes;

  const Time({
    @required this.hours,
    @required this.minutes,
  })  : assert(hours >= 0 && hours <= 12),
        assert(minutes >= 0 && minutes <= 60);

  @override
  List<Object> get props => [hours, minutes];
}
