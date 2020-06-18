import 'package:flutter/material.dart';
import 'package:pokemontcgviewer/pages/big_card.dart';
import 'package:pokemontcgviewer/pages/detailed_view.dart';
import 'package:pokemontcgviewer/pages/error.dart';
import 'package:pokemontcgviewer/pages/list_viewer.dart';
import 'package:pokemontcgviewer/pages/splashscreen.dart';

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
