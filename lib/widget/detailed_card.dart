import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemontcgviewer/model/card_model.dart';
import 'package:pokemontcgviewer/pages/big_card.dart';
import 'package:pokemontcgviewer/style/colors.dart';
import 'package:pokemontcgviewer/widget/custom_card.dart';

class DetailedCard extends StatelessWidget {
  final CardModel _pokemonCard;

  DetailedCard(this._pokemonCard);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          elevation: 2.0,
          color: cardBackgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CustomCard(
                  viewCard: Hero(
                    tag: 'card' + _pokemonCard.id,
                    child: CachedNetworkImage(
                      height: 200,
                      width: 150,
                      imageUrl: _pokemonCard.imageUrlHiRes,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/big_card',
                        arguments: ViewBigCard(
                            _pokemonCard.imageUrlHiRes, _pokemonCard.id));
                  },
                ),
                Column(
                  children: <Widget>[
                    Text('Name : ${_pokemonCard.name}'),
                    Text('Types : ${_pokemonCard.types}'),
                    Text('Weaknesses : ${_pokemonCard.weaknesses}'),
                    Text('HP : ${_pokemonCard.hp}'),
                    Text('Artist : ${_pokemonCard.artist}'),
                  ],
                ),
              ],
            ),
          ),
        ),
        Text('Description : ${_pokemonCard.text}'),
      ],
    );
  }
}
