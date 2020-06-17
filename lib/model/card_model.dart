import 'package:pokemontcgviewer/model/pokemon_ability.dart';
import 'package:pokemontcgviewer/model/pokemon_ancient_trait.dart';
import 'package:pokemontcgviewer/model/pokemon_attack.dart';
import 'package:pokemontcgviewer/model/pokemon_type_affection.dart';

class CardModel {
  String id;
  String name;
  int nationalPokedexNumber;
  String imageUrl;
  String imageUrlHiRes;
  List<String> types;
  String subtype;
  String supertype;
  String evolvesFrom;
  String hp;
  List<String> retreatCost;
  String number;
  String artist;
  String rarity;
  String series;
  String set;
  String setCode;
  List<PokemonAttack> attacks;
  List<PokemonTypeAffection> weaknesses;
  int convertedRetreatCost;
  String text;
  PokemonAbility ability;
  List<PokemonTypeAffection> resistances;
  PokemonAncientTrait ancientTrait;

  CardModel({
    this.id,
    this.name,
    this.nationalPokedexNumber,
    this.imageUrl,
    this.imageUrlHiRes,
    this.types,
    this.subtype,
    this.supertype,
    this.evolvesFrom,
    this.hp,
    this.retreatCost,
    this.number,
    this.artist,
    this.rarity,
    this.series,
    this.set,
    this.setCode,
    this.attacks,
    this.weaknesses,
    this.convertedRetreatCost,
    this.text,
    this.resistances,
    this.ancientTrait,
    this.ability,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) {
    CardModel cardModel = CardModel(
      id: json['id'].toString(),
      name: json['name'].toString(),
      nationalPokedexNumber: json['nationalPokedexNumber'],
      imageUrl: json['imageUrl'].toString(),
      imageUrlHiRes: json['imageUrlHiRes'].toString(),
      text: json['text'].toString(),
      number: json['number'].toString(),
      artist: json['artist'].toString(),
      ancientTrait: json['ancientTrait'] != null
          ? PokemonAncientTrait.fromJson(json['ancientTrait'])
          : null,
      convertedRetreatCost: json['convertedRetreatCost'],
      evolvesFrom: json['evolvesFrom'].toString(),
      hp: json['hp'].toString(),
      rarity: json['rarity'].toString(),
      resistances: json['resistances'] != null
          ? List.from(json['resistances'])
              .map((e) => PokemonTypeAffection.fromJson(e))
              .toList()
          : null,
      retreatCost:
          json['retreatCost'] != null ? List.from(json['retreatCost']) : null,
      series: json['series'].toString(),
      set: json['set'].toString(),
      setCode: json['setCode'].toString(),
      subtype: json['subtype'].toString(),
      supertype: json['supertype'].toString(),
      types: json['types'] != null ? List.from(json['types']) : null,
      weaknesses: json['weaknesses'] != null
          ? List.from(json['weaknesses'])
              .map((e) => PokemonTypeAffection.fromJson(e))
              .toList()
          : null,
      attacks: json['attacks'] != null
          ? List.from(json['attacks'])
              .map((e) => PokemonAttack.fromJson(e))
              .toList()
          : null,
      ability: json['ability'] != null
          ? PokemonAbility.fromJson(json['ability'])
          : null,
    );

    return cardModel;
  }

  @override
  String toString() {
    return 'CardModel{id: $id, name: $name, nationalPokedexNumber: $nationalPokedexNumber, imageUrl: $imageUrl, imageUrlHiRes: $imageUrlHiRes, types: $types, subtype: $subtype, supertype: $supertype, evolvesFrom: $evolvesFrom, hp: $hp, retreatCost: $retreatCost, number: $number, artist: $artist, rarity: $rarity, series: $series, set: $set, setCode: $setCode, attacks: $attacks, weaknesses: $weaknesses, convertedRetreatCost: $convertedRetreatCost, text: $text, ability: $ability, resistances: $resistances, ancientTrait: $ancientTrait}';
  }
}
