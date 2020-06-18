import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokemontcgviewer/model/card_model.dart';

class CardServiceAPI {
  static final String cardURL = "https://api.pokemontcg.io/v1/cards";

  static Future<List<CardModel>> getCardList() async {
    List<CardModel> cardList;

    var response = await http.get(cardURL).catchError((_) {
      return null;
    }).timeout(Duration(seconds: 10));

    if (response != null) {
      Map<String, dynamic> responseJson = jsonDecode(response.body);

      cardList = List.from(responseJson['cards'])
          .map((e) => CardModel.fromJson(e))
          .toList();
    }

    return cardList;
  }
}
