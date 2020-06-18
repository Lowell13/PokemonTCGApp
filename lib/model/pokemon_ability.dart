import 'package:flutter/material.dart';

class PokemonAbility {
  String name;
  String text;
  String type;

  PokemonAbility({this.name, this.text, this.type});

  factory PokemonAbility.fromJson(Map<String, dynamic> json) {
    PokemonAbility pokemonAbility = PokemonAbility(
      name: json['name'].toString(),
      text: json['text'].toString(),
      type: json['type'].toString(),
    );

    return pokemonAbility;
  }

  @override
  String toString() {
    return 'PokemonAbility{name: $name, text: $text, type: $type}';
  }

  Widget getWidget(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Ability :',
          style: Theme.of(context).textTheme.bodyText2,
        ),
        Text(
          '$type : $name',
          style: Theme.of(context).textTheme.bodyText2,
        ),
        Text(
          '$text',
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ],
    );
  }
}
