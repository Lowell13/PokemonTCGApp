import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemontcgviewer/routes/routes.dart';
import 'package:pokemontcgviewer/style/themes.dart';

import 'bloc/list_card/list_card_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ListCardBloc>(
      create: (_) => ListCardBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/splashscreen',
        routes: routes,
        theme: appTheme,
      ),
    );
  }
}
