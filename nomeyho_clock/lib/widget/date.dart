import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Date extends StatelessWidget {
  final DateTime dateTime;

  Date({
    @required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          '${DateFormat('EEEE, MMM d').format(dateTime)}',
          style: TextStyle(fontSize: 32),
        )
      ],
    );
  }
}
