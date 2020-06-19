import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemontcgviewer/bloc/list_card/list_card_bloc.dart';
import 'package:pokemontcgviewer/model/card_model.dart';
import 'package:pokemontcgviewer/service/card_service.dart';

class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIOverlays([]);
    _loadData();
  }

  _loadData() async {
    List<CardModel> _listCard;

    _listCard = await CardServiceAPI.getCardList();

    if (_listCard != null) {
      BlocProvider.of<ListCardBloc>(context)
          .add(InitializeListCardEvent(_listCard));
      Navigator.popAndPushNamed(context, '/list_viewer');
    } else {
      Navigator.popAndPushNamed(context, '/error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/pokeball.gif'),
          )),
        ),
      ),
    );
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    super.dispose();
  }
}
