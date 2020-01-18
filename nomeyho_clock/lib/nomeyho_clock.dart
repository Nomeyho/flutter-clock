import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_clock_helper/model.dart';
import 'package:intl/intl.dart';
import 'package:nomeyho_clock/nomeyho_theme.dart';
import 'package:nomeyho_clock/widget/date.dart';
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
        //Duration(minutes: 1) -
        //    Duration(seconds: _dateTime.second) -
        //    Duration(milliseconds: _dateTime.millisecond),
        Duration(seconds: 1) - Duration(milliseconds: _dateTime.millisecond),
        _updateTime,
      );
    });
  }

  get theme => Theme.of(context).brightness == Brightness.light
      ? NomeyhoTheme.lightTheme
      : NomeyhoTheme.darkTheme;

  get time => DateFormat.Hms().format(_dateTime);

  get hour =>
      DateFormat(widget.model.is24HourFormat ? 'HH' : 'hh').format(_dateTime);

  get minute => _dateTime.second.toString().padLeft(2, '0');
  //get minute => DateFormat('mm').format(_dateTime);

  Widget _buildClock({Widget child}) {
    return Semantics.fromProperties(
      properties: SemanticsProperties(
        label: 'Digital clock with time $time',
        value: time,
      ),
      child: Row(children: [
        // Hour: tens digit
        Digit(
          digit: int.parse(hour[0]),
          color: theme.accentColor,
          clockColor: theme.clockColor,
          thickness: 4,
          animationDuration: theme.digitAnimationDuration,
        ),
        // Hour: units digit
        Digit(
          digit: int.parse(hour[1]),
          color: theme.accentColor,
          clockColor: theme.clockColor,
          thickness: 4,
          animationDuration: theme.digitAnimationDuration,
        ),
        // Minute: tens digit
        Digit(
          digit: int.parse(minute[0]),
          color: theme.primaryColor,
          clockColor: theme.clockColor,
          thickness: 4,
          animationDuration: theme.digitAnimationDuration,
        ),
        // Minute: units digit
        Digit(
          digit: int.parse(minute[1]),
          color: theme.primaryColor,
          clockColor: theme.clockColor,
          thickness: 4,
          animationDuration: theme.digitAnimationDuration,
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: theme.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Date(
              dateTime: _dateTime,
              dayColor: theme.primaryColor,
              dateColor: theme.accentColor,
              fontFamily: theme.fontFamily,
            ),
            _buildClock(),
          ],
        ),
      ),
    );
  }
}
