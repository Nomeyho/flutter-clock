import 'package:flutter/material.dart';
import 'package:nomeyho_clock/model/time.dart';

class Digit {
  final int value;
  final List<Time> times;

  const Digit({@required this.value, @required this.times})
      : assert(times.length == 6);
}
