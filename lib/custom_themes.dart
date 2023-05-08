import 'package:flutter/material.dart';

enum CustomTheme {
  light,
  dark,
}

class CustomThemes {
  static final ThemeData lightTheme = ThemeData(
    colorSchemeSeed: Colors.blue,
    brightness: Brightness.light,
    useMaterial3: true,
  );

  static final ThemeData darkTheme = ThemeData(
    colorSchemeSeed: Colors.blue,
    brightness: Brightness.dark,
    useMaterial3: true,
  );

  static ThemeData getTheme(CustomTheme theme) {
    switch (theme) {
      case CustomTheme.light:
        return lightTheme;
      case CustomTheme.dark:
        return darkTheme;
      default:
        return lightTheme;
    }
  }
}
