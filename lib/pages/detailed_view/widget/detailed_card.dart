import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemontcgviewer/model/card_model.dart';
import 'package:pokemontcgviewer/pages/big_card/big_card.dart';
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
                    Text(
                      'Name : ${_pokemonCard.name}',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    Text(''),
                    Text(
                      'Supertype : ${_pokemonCard.supertype}',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    Text(
                      'Subtype : ${_pokemonCard.subtype}',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    Text(''),
                    Text(
                      'Artist : ${_pokemonCard.artist}',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    Text(
                      'Rarity : ${_pokemonCard.rarity}',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    Text(
                      'Serie : ${_pokemonCard.series}',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    Text(
                      'Set : ${_pokemonCard.set}',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    Text(
                      'Card number for set: ${_pokemonCard.number}',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Description : ${_pokemonCard.text.join()}',
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
      ],
    );
  }
}
