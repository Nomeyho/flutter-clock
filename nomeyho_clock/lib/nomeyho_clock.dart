import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_clock_helper/model.dart';
import 'package:intl/intl.dart';
import 'package:nomeyho_clock/model/time.dart';
import 'package:nomeyho_clock/widget/clock.dart';
import 'package:nomeyho_clock/widget/digit.dart';

class NomeyhoClock extends StatefulWidget {
  const NomeyhoClock(this.model);

  final ClockModel model;

  @override
  _NomeyhoClockState createState() => _NomeyhoClockState();
}

class _NomeyhoClockState extends State<NomeyhoClock> {
  DateTime _dateTime;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    widget.model.addListener(_updateModel);
    _updateTime();
    _updateModel();
  }

  @override
  void didUpdateWidget(NomeyhoClock oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.model != oldWidget.model) {
      oldWidget.model.removeListener(_updateModel);
      widget.model.addListener(_updateModel);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    widget.model.removeListener(_updateModel);
    super.dispose();
  }

  void _updateModel() {
    setState(() {
      // Cause the clock to rebuild when the model changes.
    });
  }

  void _updateTime() {
    setState(() {
      _dateTime = DateTime.now();
      // Update once per minute. Make sure to do it at the beginning of each
      // new minute, so that the clock is accurate.
      _timer = Timer(
        Duration(minutes: 1) -
            Duration(seconds: _dateTime.second) -
            Duration(milliseconds: _dateTime.millisecond),
        _updateTime,
      );
    });
  }

  get time => DateFormat.Hms().format(_dateTime);

  get hour =>
      DateFormat(widget.model.is24HourFormat ? 'HH' : 'hh').format(_dateTime);

  get minute => DateFormat('mm').format(_dateTime);

  @override
  Widget build(BuildContext context) {
    final digits = [
      int.parse(hour[0]),
      int.parse(hour[1]),
      int.parse(minute[0]),
      int.parse(minute[1])
    ];

    return Semantics.fromProperties(
      properties: SemanticsProperties(
        label: 'Digital clock with time $time',
        value: time,
      ),
      child: Container(
        color: Colors.white,
        /*
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Clock(time: Time(hours: 2, minutes: 35)),
        )
        */
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
              children: digits
                  .map((digit) => Digit(digit: digit))
                  .toList(growable: false)),
        ),
      ),
    );
  }
}
