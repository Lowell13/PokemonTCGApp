import 'package:pokemontcgviewer/model/card_model.dart';

class ListCardRepository {
  List<CardModel> cardList = List<CardModel>();
  List<CardModel> duplicateCardList;

  static final ListCardRepository _singleton = ListCardRepository._internal();

  ListCardRepository._internal();

  factory ListCardRepository() {
    return _singleton;
  }
}
