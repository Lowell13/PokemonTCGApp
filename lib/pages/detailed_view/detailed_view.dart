import 'package:flutter/material.dart';
import 'package:pokemontcgviewer/model/card_model.dart';
import 'package:pokemontcgviewer/pages/detailed_view/widget/detailed_card.dart';
import 'package:pokemontcgviewer/pages/detailed_view/widget/detailed_pokemon.dart';

class DetailedView extends StatefulWidget {
  @override
  _DetailedViewState createState() => _DetailedViewState();
}

class _DetailedViewState extends State<DetailedView> {
  Widget _getView(CardModel cardModel) {
    return cardModel.isPokemon()
        ? DetailedPokemon(cardModel)
        : DetailedCard(cardModel);
  }

  @override
  Widget build(BuildContext context) {
    final CardModel cardModel = ModalRoute.of(context).settings.arguments;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: Text(
            cardModel.name,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        body: Container(
          child: _getView(cardModel), // DetailedCard(detailedPokemon.pokemon),
        ),
      ),
    );
  }
}
