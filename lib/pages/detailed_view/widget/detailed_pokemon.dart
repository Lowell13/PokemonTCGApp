import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemontcgviewer/model/card_model.dart';
import 'package:pokemontcgviewer/model/pokemon_attack.dart';
import 'package:pokemontcgviewer/model/pokemon_type_affection.dart';
import 'package:pokemontcgviewer/pages/big_card/big_card.dart';
import 'package:pokemontcgviewer/widget/custom_card.dart';

class DetailedPokemon extends StatelessWidget {
  final CardModel _pokemonCard;

  DetailedPokemon(this._pokemonCard);

  Widget _getTypeIcon(BuildContext context, var type) {
    List<Widget> list = List<Widget>();

    if (type != null) {
      if (type is String) {
        list.add(Image(
          image:
              AssetImage("assets/types_icon/min-" + type.toString() + ".png"),
        ));
      } else if (type is List<String>) {
        List.from(type).forEach((element) {
          list.add(
            Image(
              image: AssetImage(
                  "assets/types_icon/min-" + element.toString() + ".png"),
            ),
          );
        });
      } else if (type is List<PokemonTypeAffection>) {
        List.from(type).forEach((element) {
          list.add(
            Image(
              image: AssetImage(
                  "assets/types_icon/min-" + element.type.toString() + ".png"),
            ),
          );
          list.add(Text(
            ' ${element.value.toString()}',
            style: Theme.of(context).textTheme.bodyText2,
          ));
        });
      }
    }

    return Container(
        child: Row(
      children: list,
    ));
  }

  Widget _showIfNotNull(BuildContext context, String label, var field) {
    List<Widget> list = List<Widget>();

    if (field != null) {
      if (field is List<String>) {
        return Text(
          '$label : ${field.join().toString()}',
          style: Theme.of(context).textTheme.bodyText2,
        );
      } else if (field is List<PokemonAttack>) {
        List.from(field).forEach((element) {
          list.add(Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _getTypeIcon(context, element.cost),
              Text(
                '${element.name}',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Text(
                '${element.damage}',
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ));
          list.add(Text(
            '${element.text}',
            style: Theme.of(context).textTheme.bodyText2,
          ));
        });
        return Column(
          children: list,
        );
      } else {
        return field.getWidget(context);
      }
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          elevation: 2.0,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
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
                      'Pokedex Number : ${_pokemonCard.nationalPokedexNumber}',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'HP : ${_pokemonCard.hp} ',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        _getTypeIcon(context, _pokemonCard.types),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'Retreat cost : ',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        _getTypeIcon(
                          context,
                          _pokemonCard.retreatCost,
                        )
                      ],
                    ),
                    Text(''),
                    Text(
                      'Evolves from : ${_pokemonCard.evolvesFrom}',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  'Weaknesses : ',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                _getTypeIcon(context, _pokemonCard.weaknesses),
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  'Resistance : ',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                _getTypeIcon(context, _pokemonCard.resistances),
              ],
            ),
          ],
        ),
        Expanded(
          child: ListView(
            children: <Widget>[
              _showIfNotNull(context, 'Text', _pokemonCard.text),
              _showIfNotNull(
                  context, 'Ancient trait', _pokemonCard.ancientTrait),
              _showIfNotNull(context, 'Ability', _pokemonCard.ability),
              _showIfNotNull(context, 'Atttacks', _pokemonCard.attacks),
            ],
          ),
        ),
      ],
    );
  }
}
