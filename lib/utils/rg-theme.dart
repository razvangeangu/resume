import 'package:flutter/material.dart';

class RGTheme {
  static final _textTheme = TextTheme(
    headline1: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
    headline2: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600),
  );

  static ThemeData get light {
    return ThemeData(
      brightness: Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      dividerColor: Colors.black87,
      textTheme: _textTheme,
    );
  }

  static ThemeData get dark {
    return ThemeData(
      brightness: Brightness.dark,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      dividerColor: Colors.white30,
      textTheme: _textTheme,
    );
  }
}
