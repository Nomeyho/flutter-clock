import 'package:flutter/material.dart';

// TODO use a scale function to keep proportion?
class NomeyhoTheme extends InheritedWidget {
  /// Light theme
  static final NomeyhoThemeData lightTheme = NomeyhoThemeData(
    backgroundColor: Color(0xff0a141b),
    primary_700: Color(0xff74e9fd),
    accent_700: Color(0xfffd8074),
    fontFamily: 'Barlow',
  );

  /// Dark theme
  static final NomeyhoThemeData darkTheme = NomeyhoThemeData(
    backgroundColor: Color(0xff0a141b),
    primary_700: Color(0xff74e9fd),
    accent_700: Color(0xfffd8074),
    fontFamily: 'Barlow',
  );

  NomeyhoTheme({
    @required Widget child,
  })  : assert(child != null),
        super(child: child);

  static NomeyhoThemeData of(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? lightTheme
        : darkTheme;
  }

  @override
  bool updateShouldNotify(NomeyhoTheme oldWidget) {
    return false;
  }
}

class NomeyhoThemeData {
  final Color backgroundColor;
  final Color primary_700;
  final Color accent_700;
  final String fontFamily;

  NomeyhoThemeData({
    this.backgroundColor,
    this.primary_700,
    this.accent_700,
    this.fontFamily,
  });
}
