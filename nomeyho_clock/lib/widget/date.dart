import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:intl/intl.dart';
import 'package:nomeyho_clock/nomeyho_theme.dart';

class Date extends StatelessWidget {
  final DateTime dateTime;

  Date({
    @required this.dateTime,
  });

  get day => '${DateFormat('EEEE').format(dateTime)}';

  get date => '${DateFormat('MMM d').format(dateTime)}';

  Widget _withSemantics({Widget child}) {
    return Semantics.fromProperties(
      properties: SemanticsProperties(
        label: 'Text with day date $day, $date',
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
              fontFamily: NomeyhoTheme.of(context).fontFamily,
              fontSize: width / 15, // responsive text
            ),
            children: <TextSpan>[
              TextSpan(
                text: '$day, ',
                style: TextStyle(
                  color: NomeyhoTheme.of(context).primary_700,
                ),
              ),
              TextSpan(
                text: date,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: NomeyhoTheme.of(context).accent_700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
