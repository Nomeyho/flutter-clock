import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:intl/intl.dart';

class Date extends StatelessWidget {
  final DateTime dateTime;
  final Color dayColor;
  final Color dateColor;
  final String fontFamily;

  Date({
    @required this.dateTime,
    @required this.dayColor,
    @required this.dateColor,
    @required this.fontFamily,
  })  : assert(dateTime != null),
        assert(dayColor != null),
        assert(dateColor != null),
        assert(fontFamily != null);

  get day => '${DateFormat('EEEE').format(dateTime)}';

  get date => '${DateFormat('MMM d').format(dateTime)}';

  Widget _withSemantics({Widget child}) {
    return Semantics.fromProperties(
      properties: SemanticsProperties(
        label: 'Text with day $day and date $date',
        value: '$day, $date',
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return _withSemantics(
      child: Center(
        child: RichText(
          text: TextSpan(
            style: TextStyle(
              fontFamily: fontFamily,
              fontSize: width / 15, // responsive text
              fontWeight: FontWeight.w100,
            ),
            children: <TextSpan>[
              TextSpan(
                text: '$day, ',
                style: TextStyle(
                  color: dayColor,
                ),
              ),
              TextSpan(
                text: date,
                style: TextStyle(
                  color: dateColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
