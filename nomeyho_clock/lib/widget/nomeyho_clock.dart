import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_clock_helper/model.dart';
import 'package:intl/intl.dart';
import 'package:nomeyho_clock/model/digit.dart';
import 'package:nomeyho_clock/model/time.dart';
import 'package:nomeyho_clock/widget/clock.dart';

final _digit = [
  Digit(value: 0, times: [
    Time(hours: 6, minutes: 15),
    Time(hours: 9, minutes: 30),
    Time(hours: 6, minutes: 0),
    Time(hours: 0, minutes: 30),
    Time(hours: 3, minutes: 0),
    Time(hours: 0, minutes: 45),
  ]),
  Digit(value: 1, times: [
    null,
    Time(hours: 6, minutes: 30),
    null,
    Time(hours: 6, minutes: 0),
    null,
    Time(hours: 0, minutes: 0)
  ]),
  Digit(value: 2, times: [
    Time(hours: 3, minutes: 15),
    Time(hours: 9, minutes: 30),
    Time(hours: 6, minutes: 15),
    Time(hours: 0, minutes: 45),
    Time(hours: 0, minutes: 15),
    Time(hours: 9, minutes: 45)
  ]),
  Digit(value: 3, times: [
    Time(hours: 3, minutes: 15),
    Time(hours: 9, minutes: 30),
    Time(hours: 3, minutes: 15),
    Time(hours: 9, minutes: 0),
    Time(hours: 3, minutes: 15),
    Time(hours: 9, minutes: 0)
  ]),
  Digit(value: 4, times: [
    Time(hours: 6, minutes: 30),
    Time(hours: 6, minutes: 30),
    Time(hours: 0, minutes: 15),
    Time(hours: 6, minutes: 0),
    null,
    Time(hours: 0, minutes: 0)
  ]),
  Digit(value: 5, times: [
    Time(hours: 6, minutes: 15),
    Time(hours: 9, minutes: 45),
    Time(hours: 0, minutes: 15),
    Time(hours: 6, minutes: 45),
    Time(hours: 3, minutes: 15),
    Time(hours: 0, minutes: 45)
  ]),
  Digit(value: 6, times: [
    Time(hours: 6, minutes: 15),
    Time(hours: 9, minutes: 45),
    Time(hours: 6, minutes: 0),
    Time(hours: 6, minutes: 45),
    Time(hours: 0, minutes: 15),
    Time(hours: 0, minutes: 45)
  ]),
  Digit(value: 7, times: [
    Time(hours: 6, minutes: 15),
    Time(hours: 6, minutes: 45),
    Time(hours: 0, minutes: 15),
    Time(hours: 0, minutes: 45),
    Time(hours: 0, minutes: 15),
    Time(hours: 0, minutes: 45)
  ]),
  Digit(value: 8, times: [
    Time(hours: 6, minutes: 15),
    Time(hours: 6, minutes: 45),
    Time(hours: 0, minutes: 15),
    Time(hours: 0, minutes: 45),
    Time(hours: 0, minutes: 15),
    Time(hours: 0, minutes: 45)
  ]),
  Digit(value: 9, times: [
    Time(hours: 6, minutes: 15),
    Time(hours: 6, minutes: 45),
    Time(hours: 3, minutes: 0),
    Time(hours: 6, minutes: 0),
    Time(hours: 3, minutes: 15),
    Time(hours: 0, minutes: 45)
  ]),
];

class NomeyhoClock extends StatefulWidget {
  const NomeyhoClock(this.model);

  final ClockModel model;

  @override
  _NomeyhoClockState createState() => _NomeyhoClockState();
}

class _NomeyhoClockState extends State<NomeyhoClock> {
  var _now = DateTime.now();
  var _is24HourFormat = false;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    widget.model.addListener(_updateModel);
    // Set the initial values.
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
      _is24HourFormat = widget.model.is24HourFormat;
    });
  }

  void _updateTime() {
    setState(() {
      _now = DateTime.now();
      // Update once per second. Make sure to do it at the beginning of each
      // new second, so that the clock is accurate.
      _timer = Timer(
        Duration(seconds: 1) - Duration(milliseconds: _now.millisecond),
        _updateTime,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final time = DateFormat.Hms().format(DateTime.now());

    final hourChars = _now.hour.toString().padLeft(2, '0');
    final minuteChars = _now.minute.toString().padLeft(2, '0');

    final d1 = int.parse(hourChars[0]);
    final d2 = int.parse(hourChars[1]);
    final d3 = int.parse(minuteChars[0]);
    final d4 = int.parse(minuteChars[1]);

    final clocks1 = _digit[d1].times.map((t) => Clock(time: t)).toList(growable: false);
    final clocks2 = _digit[d2].times.map((t) => Clock(time: t)).toList(growable: false);
    final clocks3 = _digit[d3].times.map((t) => Clock(time: t)).toList(growable: false);
    final clocks4 = _digit[d4].times.map((t) => Clock(time: t)).toList(growable: false);

    return Semantics.fromProperties(
      properties: SemanticsProperties(
        label: 'Digital clock with time $time',
        value: time,
      ),
      child: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.greenAccent,
                child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  children: clocks1,
                ),
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: clocks2,
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: clocks3,
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: clocks4,
              ),
            )
          ],
        ),
      ),
    );
  }
}
