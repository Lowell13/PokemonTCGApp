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
}
