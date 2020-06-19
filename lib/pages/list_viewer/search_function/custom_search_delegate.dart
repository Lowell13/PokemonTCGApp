import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemontcgviewer/bloc/list_card/list_card_bloc.dart';
import 'package:pokemontcgviewer/model/card_model.dart';
import 'package:pokemontcgviewer/pages/list_viewer/widget/pokemon_grid_viewer.dart';
import 'package:pokemontcgviewer/repository/list_card/list_card_repository.dart';

class CustomSearchDelegate extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context);
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        BlocProvider.of<ListCardBloc>(context).add(ResetListCardEvent());
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    _filterResults(context, query);

    return PokemonGridViewer();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildResults(context);
  }

  void _filterResults(BuildContext context, String query) {
    List<CardModel> tmpSearchList = List<CardModel>();
    tmpSearchList.addAll(ListCardRepository().duplicateCardList);

    if (query.isNotEmpty) {
      List<CardModel> tmpDataList = List<CardModel>();

      tmpSearchList.forEach((element) {
        if (element.name.toLowerCase().contains(query.toLowerCase())) {
          tmpDataList.add(element);
        }
      });
      BlocProvider.of<ListCardBloc>(context)
          .add(ChangeListCardEvent(tmpDataList));
    } else {
      BlocProvider.of<ListCardBloc>(context).add(ResetListCardEvent());
    }
  }
}
