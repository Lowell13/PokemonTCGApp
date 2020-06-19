import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemontcgviewer/repository/theme_picker/theme_picker_repository.dart';
import 'package:pokemontcgviewer/style/my_little_pony_theme.dart';
import 'package:pokemontcgviewer/style/paint_it_black_theme.dart';

class ThemePickerEvent {}

class InitThemePickerEvent extends ThemePickerEvent {}

class ChangeThemePickerEvent extends ThemePickerEvent {
  final ThemePickerState state;

  ChangeThemePickerEvent(this.state);
}

class GiveThemePickerEvent extends ThemePickerEvent {
  static ThemeData getTheme() {
    return ThemePickerRepository().currentTheme;
  }
}

class ThemePickerState {}

class PibThemePickerState extends ThemePickerState {}

class MlpThemePickerState extends ThemePickerState {}

class HasValueThemePicker extends ThemePickerState {
  final ThemeData themeData;

  HasValueThemePicker(this.themeData);
}

class ThemePickerBloc extends Bloc<ThemePickerEvent, ThemePickerState> {
  @override
  ThemePickerState get initialState => PibThemePickerState();

  @override
  Stream<ThemePickerState> mapEventToState(ThemePickerEvent event) async* {
    if (event is ChangeThemePickerEvent) {
      if (event.state is PibThemePickerState) {
        ThemePickerRepository().currentTheme = paintItBlack;
      } else {
        ThemePickerRepository().currentTheme = myLittlePony;
      }
    }

    ThemeData currentTheme = ThemePickerRepository().currentTheme;

    yield HasValueThemePicker(currentTheme);
  }
}
