import 'package:flutter/material.dart';

enum CustomTheme {
  light,
  dark,
}

class CustomThemes {
  static final ThemeData lightTheme = ThemeData(
    colorSchemeSeed: const Color(0XFF6C9BCF),
    brightness: Brightness.light,
    // textTheme: GoogleFonts.robotoTextTheme(),
    useMaterial3: true,
  );

  static final ThemeData darkTheme = ThemeData(
    colorSchemeSeed: const Color(0XFF6C9BCF),
    brightness: Brightness.dark,
    // textTheme: GoogleFonts.montserratTextTheme(),
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
