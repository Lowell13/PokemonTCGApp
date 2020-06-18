class PokemonTypeAffection {
  String type;
  String value;

  PokemonTypeAffection({this.type, this.value});

  factory PokemonTypeAffection.fromJson(Map<String, dynamic> json) {
    PokemonTypeAffection pokemonTypeAffection = PokemonTypeAffection(
      type: json['type'].toString(),
      value: json['value'].toString(),
    );

    return pokemonTypeAffection;
  }

  @override
  String toString() {
    return 'PokemonTypeAffection{name: $type, value: $value}';
  }
}
