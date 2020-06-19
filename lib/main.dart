import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemontcgviewer/bloc/theme_picker/theme_picker_bloc.dart';
import 'package:pokemontcgviewer/repository/theme_picker/theme_picker_repository.dart';
import 'package:pokemontcgviewer/routes/routes.dart';

import 'bloc/list_card/list_card_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ListCardBloc>(
          create: (_) => ListCardBloc(),
        ),
        BlocProvider<ThemePickerBloc>(
          create: (_) => ThemePickerBloc(),
        ),
      ],
      child: BlocBuilder<ThemePickerBloc, ThemePickerState>(
        builder: _buildWithTheme,
      ),
    );
  }

  Widget _buildWithTheme(BuildContext context, ThemePickerState state) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splashscreen',
      routes: routes,
      theme: ThemePickerRepository().currentTheme,
    );
  }
}
