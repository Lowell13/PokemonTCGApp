class PokemonAttack {
  List<String> cost;
  String name;
  String text;
  String damage;
  int convertedEnergyCost;

  PokemonAttack(
      {this.cost, this.name, this.text, this.damage, this.convertedEnergyCost});

  factory PokemonAttack.fromJson(Map<String, dynamic> json) {
    PokemonAttack pokemonAttack = PokemonAttack(
      cost: json['cost'] != null ? List.from(json['cost']) : null,
      name: json['name'],
      text: json['text'],
      damage: json['damage'],
      convertedEnergyCost: json['convertedEnergyCost'],
    );

    return pokemonAttack;
  }

  @override
  String toString() {
    return 'PokemonAttack{cost: $cost, name: $name, text: $text, damage: $damage, convertedEnergyCost: $convertedEnergyCost}';
  }
}
