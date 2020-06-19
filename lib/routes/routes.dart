import 'package:flutter/material.dart';
import 'package:pokemontcgviewer/pages/big_card/big_card.dart';
import 'package:pokemontcgviewer/pages/detailed_view/detailed_view.dart';
import 'package:pokemontcgviewer/pages/error/error.dart';
import 'package:pokemontcgviewer/pages/list_viewer/list_viewer.dart';
import 'package:pokemontcgviewer/pages/splashscreen/splashscreen.dart';

Map<String, WidgetBuilder> routes = {
  '/splashscreen': (context) {
    return Splashscreen();
  },
  '/list_viewer': (context) {
    return ListViewer();
  },
  '/detailed_view': (context) {
    return DetailedView();
  },
  '/big_card': (context) {
    return BigCard();
  },
  '/error': (context) {
    return Error();
  },
};
