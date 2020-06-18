import 'package:flutter/material.dart';

class PokemonAncientTrait {
  String name;
  String text;

  PokemonAncientTrait({this.name, this.text});

  factory PokemonAncientTrait.fromJson(Map<String, dynamic> json) {
    PokemonAncientTrait pokemonAncientTrait = PokemonAncientTrait(
      name: json['name'].toString(),
      text: json['text'].toString(),
    );

    return pokemonAncientTrait;
  }

  @override
  String toString() {
    return 'PokemonAncientTrait{name: $name, text: $text}';
  }

  Widget getWidget(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Ancient trait :',
          style: Theme.of(context).textTheme.bodyText2,
        ),
        Text(
          '$name : $text',
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ],
    );
  }
}
