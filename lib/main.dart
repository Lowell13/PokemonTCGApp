import 'package:flutter/material.dart';
import 'package:pokemontcgviewer/routes/routes.dart';
import 'package:pokemontcgviewer/style/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splashscreen',
      routes: routes,
      theme: appTheme,
    );
  }
}
