import 'package:flutter/material.dart';
import 'package:pokemontcgviewer/style/colors.dart';

ThemeData myLittlePony = ThemeData(
  brightness: Brightness.light,
  primaryColor: mlpPrimaryColor,
  accentColor: mlpAccentColor,
  appBarTheme: appBarTheme,
  textTheme: textTheme,
  cursorColor: mlpPrimaryTextColor,
  cardColor: mlpAccentColor,
);

AppBarTheme appBarTheme = AppBarTheme(
  brightness: Brightness.light,
  color: mlpPrimaryColor,
  elevation: 1.0,
  textTheme: textTheme,
);

TextTheme textTheme = TextTheme(
  bodyText1: TextStyle(
    fontSize: 20.0,
    color: mlpPrimaryTextColor,
  ),
  bodyText2: TextStyle(
    fontSize: 16.0,
    color: mlpPrimaryTextColor,
  ),
  button: TextStyle(
    fontSize: 10.0,
    color: mlpPrimaryTextColor,
  ),
);
