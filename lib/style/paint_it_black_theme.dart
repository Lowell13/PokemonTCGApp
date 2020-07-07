import 'package:flutter/material.dart';
import 'package:pokemontcgviewer/style/colors.dart';

ThemeData paintItBlack = ThemeData(
  brightness: Brightness.dark,
  primaryColor: pibPrimaryColor,
  accentColor: pibAccentColor,
  appBarTheme: appBarTheme,
  textTheme: textTheme,
  cursorColor: pibPrimaryTextColor,
  cardColor: pibAccentColor,
  iconTheme: iconThemeData,
  backgroundColor: pibBackgroundColor,
);

AppBarTheme appBarTheme = AppBarTheme(
  brightness: Brightness.dark,
  color: pibPrimaryColor,
  elevation: 1.0,
  textTheme: textTheme,
);

TextTheme textTheme = TextTheme(
  bodyText1: TextStyle(
    fontSize: 20.0,
    color: pibPrimaryTextColor,
  ),
  bodyText2: TextStyle(
    fontSize: 16.0,
    color: pibPrimaryTextColor,
  ),
  button: TextStyle(
    fontSize: 10.0,
    color: pibPrimaryTextColor,
  ),
);

IconThemeData iconThemeData = IconThemeData(
  color: iconColor,
);
