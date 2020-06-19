import 'package:flutter/material.dart';
import 'package:pokemontcgviewer/style/paint_it_black_theme.dart';

class ThemePickerRepository {
  ThemeData currentTheme = paintItBlack;

  static final ThemePickerRepository _singleton =
      ThemePickerRepository._internal();

  ThemePickerRepository._internal();

  factory ThemePickerRepository() {
    return _singleton;
  }
}
