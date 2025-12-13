import 'package:flutter/material.dart';

MaterialColor myThemeColor = Colors.teal;

class MyThemeData {
  static ThemeData getThemeDataLight() {
    return _getBaseThemeData().copyWith(

    );
  }
  static ThemeData _getBaseThemeData() {
    return ThemeData(
      colorSchemeSeed: myThemeColor,
      useMaterial3: true,
    );
  }
}
