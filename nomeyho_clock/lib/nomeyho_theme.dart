import 'package:flutter/material.dart';

class NomeyhoTheme {
  /// Light theme
  static final NomeyhoTheme lightTheme = NomeyhoTheme(
    backgroundColor: Color(0xfffffbe0),
    primaryColor: Color(0xff66bfc0),
    accentColor: Color(0xffcc5610),
    clockColor: Color(0xff553d38).withAlpha(20),
    fontFamily: 'Barlow',
  );

  /// Dark theme
  static final NomeyhoTheme darkTheme = NomeyhoTheme(
    backgroundColor: Color(0xff0a141b),
    primaryColor: Color(0xff74e9fd),
    accentColor: Color(0xfffd8074),
    clockColor: Colors.white.withAlpha(10),
    fontFamily: 'Barlow',
  );

  final Color backgroundColor;
  final Color primaryColor;
  final Color accentColor;
  final Color clockColor;
  final String fontFamily;

  NomeyhoTheme({
    @required this.backgroundColor,
    @required this.primaryColor,
    @required this.accentColor,
    @required this.clockColor,
    @required this.fontFamily,
  })  : assert(backgroundColor != null),
        assert(primaryColor != null),
        assert(accentColor != null),
        assert(clockColor != null),
        assert(fontFamily != null);
}
