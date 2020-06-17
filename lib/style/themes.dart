import 'package:flutter/material.dart';
import 'package:pokemontcgviewer/style/colors.dart';

ThemeData appTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.red, //primaryColor,
  accentColor: Colors.blueAccent,
  appBarTheme: appBarTheme,
  textTheme: textTheme,
);

AppBarTheme appBarTheme = AppBarTheme(
  brightness: Brightness.dark,
  color: primaryColor,
  elevation: 1.0,
  textTheme: textTheme,
);

TextTheme textTheme = TextTheme(
  bodyText1: TextStyle(
    fontSize: 20.0,
    color: primaryTextColor,
  ),
  bodyText2: TextStyle(
    fontSize: 16.0,
    color: primaryTextColor,
  ),
  button: TextStyle(
    fontSize: 10.0,
    color: primaryTextColor,
  ),
);
