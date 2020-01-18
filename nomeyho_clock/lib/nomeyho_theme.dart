import 'package:flutter/material.dart';

class NomeyhoTheme {
  /// Light theme
  static final NomeyhoTheme lightTheme = NomeyhoTheme(
    backgroundColor: Color(0xffF9F9FA),
    primaryColor: Color(0xff3D5C93),
    accentColor: Color(0xffE35F66),
    clockColor: Colors.black.withAlpha(15),
    fontFamily: 'Barlow',
    digitAnimationDuration: 500,
  );

  /// Dark theme
  static final NomeyhoTheme darkTheme = NomeyhoTheme(
    backgroundColor: Color(0xff0a141b),
    primaryColor: Color(0xff74e9fd),
    accentColor: Color(0xfffd8074),
    clockColor: Colors.white.withAlpha(10),
    fontFamily: 'Barlow',
    digitAnimationDuration: 500,
  );

  final Color backgroundColor;
  final Color primaryColor;
  final Color accentColor;
  final Color clockColor;
  final String fontFamily;
  final int digitAnimationDuration; // ms

  NomeyhoTheme({
    @required this.backgroundColor,
    @required this.primaryColor,
    @required this.accentColor,
    @required this.clockColor,
    @required this.fontFamily,
    @required this.digitAnimationDuration,
  })  : assert(backgroundColor != null),
        assert(primaryColor != null),
        assert(accentColor != null),
        assert(clockColor != null),
        assert(fontFamily != null),
        assert(digitAnimationDuration != null);
}
