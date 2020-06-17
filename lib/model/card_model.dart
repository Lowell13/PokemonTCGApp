class CardModel {
  String name;
  String id;
  String nationalPokemonNumber;
  String imageUrl;
  String imageUrlHiRes;
  List<String> types;
  String subtype;
  String supertype;
  String hp;
  String number;
  String artist;
  String rarity;
  String series;
  String set;
  String setCode;
  List<String> retreatCost;
  String convertedRetreatCost;
  String text;
  String attackDamage;
  String attackCost;
  String attackName;
  String attackText;
  String weaknesses;
  String resistances;
  String ancientTrait;
  String abilityName;
  String abilityText;
  String abilityType;
  String evolvesFrom;
  String contains;

  CardModel(
      {this.name,
      this.id,
      this.nationalPokemonNumber,
      this.imageUrl,
      this.imageUrlHiRes,
      this.types,
      this.subtype,
      this.supertype,
      this.hp,
      this.number,
      this.artist,
      this.rarity,
      this.series,
      this.set,
      this.setCode,
      this.retreatCost,
      this.convertedRetreatCost,
      this.text,
      this.attackDamage,
      this.attackCost,
      this.attackName,
      this.attackText,
      this.weaknesses,
      this.resistances,
      this.ancientTrait,
      this.abilityName,
      this.abilityText,
      this.abilityType,
      this.evolvesFrom,
      this.contains});

  factory CardModel.fromJson(Map<String, dynamic> json) {
    CardModel cardModel = CardModel(
      name: json['name'].toString(),
      id: json['id'].toString(),
      imageUrl: json['imageUrl'].toString(),
      imageUrlHiRes: json['imageUrlHiRes'].toString(),
      text: json['text'].toString(),
      number: json['number'].toString(),
      artist: json['artist'].toString(),
      abilityName: json['abilityName'].toString(),
      abilityText: json['abilityText'].toString(),
      abilityType: json['abilityType'].toString(),
      ancientTrait: json['ancientTrait'].toString(),
      attackCost: json['attackCost'].toString(),
      attackDamage: json['attackDamage'].toString(),
      attackName: json['attackName'].toString(),
      attackText: json['attackText'].toString(),
      contains: json['contains'].toString(),
      convertedRetreatCost: json['convertedRetreatCost'].toString(),
      evolvesFrom: json['evolvesFrom'].toString(),
      hp: json['hp'].toString(),
      nationalPokemonNumber: json['nationalPokemonNumber'].toString(),
      rarity: json['rarity'].toString(),
      resistances: json['resistances'].toString(),
      retreatCost:
          json['retreatCost'] != null ? List.from(json['retreatCost']) : null,
      series: json['series'].toString(),
      set: json['set'].toString(),
      setCode: json['setCode'].toString(),
      subtype: json['subtype'].toString(),
      supertype: json['supertype'].toString(),
      types: json['types'] != null ? List.from(json['types']) : null,
      weaknesses: json['weaknesses'].toString(),
    );

    return cardModel;
  }

  @override
  String toString() {
    return 'CardModel{name: $name, id: $id, nationalPokemonNumber: $nationalPokemonNumber, imageUrl: $imageUrl, imageUrlHiRes: $imageUrlHiRes, types: $types, subtype: $subtype, supertype: $supertype, hp: $hp, number: $number, artist: $artist, rarity: $rarity, series: $series, set: $set, setCode: $setCode, retreatCost: $retreatCost, convertedRetreatCost: $convertedRetreatCost, text: $text, attackDamage: $attackDamage, attackCost: $attackCost, attackName: $attackName, attackText: $attackText, weaknesses: $weaknesses, resistances: $resistances, ancientTrait: $ancientTrait, abilityName: $abilityName, abilityText: $abilityText, abilityType: $abilityType, evolvesFrom: $evolvesFrom, contains: $contains}';
  }
}
