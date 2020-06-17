import 'package:flutter/material.dart';
import 'package:pokemontcgviewer/model/card_model.dart';
import 'package:pokemontcgviewer/widget/detailed_card.dart';

class DetailedPokemon {
  CardModel pokemon;

  DetailedPokemon(this.pokemon);

  @override
  String toString() {
    return 'DetailedPokemon{pokemon: $pokemon}';
  }
}

class DetailedView extends StatefulWidget {
  @override
  _DetailedViewState createState() => _DetailedViewState();
}

class _DetailedViewState extends State<DetailedView> {
  @override
  Widget build(BuildContext context) {
    final DetailedPokemon detailedPokemon =
        ModalRoute.of(context).settings.arguments;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(detailedPokemon.pokemon.name),
        ),
        body: Container(
          child: DetailedCard(detailedPokemon.pokemon),
        ),
      ),
    );
  }
}
