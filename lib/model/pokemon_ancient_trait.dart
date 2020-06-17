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
}
