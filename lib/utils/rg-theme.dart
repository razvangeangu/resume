import 'package:flutter/material.dart';
import 'package:resume/utils/rg-colors.dart';

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
      scaffoldBackgroundColor: RGColors.primary[50],
      primaryColor: RGColors.primary,
      primarySwatch: RGColors.primary,
      primaryColorDark: RGColors.primary,
      buttonTheme: ButtonThemeData(
        buttonColor: RGColors.primary,
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      brightness: Brightness.dark,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      dividerColor: Colors.white30,
      textTheme: _textTheme,
      scaffoldBackgroundColor: RGColors.primary[900],
      primaryColor: RGColors.primary,
      primarySwatch: RGColors.primary,
      primaryColorDark: RGColors.primary,
      buttonTheme: ButtonThemeData(
        buttonColor: RGColors.primary,
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }
}
