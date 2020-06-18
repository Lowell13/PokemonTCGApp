import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemontcgviewer/model/card_model.dart';
import 'package:pokemontcgviewer/style/colors.dart';
import 'package:pokemontcgviewer/widget/custom_card.dart';

class CustomSearchDelegate extends SearchDelegate {
  List<CardModel> _listCardModel;
  final List<CardModel> duplicateList;

  CustomSearchDelegate(this._listCardModel, this.duplicateList);

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context);
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    _filterResults(query, duplicateList);

    return Column(
      children: <Widget>[
        Expanded(
          child: GridView.builder(
              itemCount: _listCardModel.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
              ),
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              itemBuilder: (context, position) {
                return Card(
                  elevation: 2.0,
                  color: accentColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '${_listCardModel[position].name}',
                          style: Theme.of(context).textTheme.bodyText2,
                          overflow: TextOverflow.clip,
                        ),
                        CustomCard(
                          viewCard: Hero(
                            tag: 'card' + _listCardModel[position].id,
                            child: CachedNetworkImage(
                              imageUrl: _listCardModel[position].imageUrlHiRes,
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/detailed_view',
                                arguments: _listCardModel[position]);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildResults(context);
  }

  void _filterResults(String query, List<CardModel> duplicateList) {
    List<CardModel> tmpSearchList = List<CardModel>();
    tmpSearchList.addAll(duplicateList);

    if (query.isNotEmpty) {
      List<CardModel> tmpDataList = List<CardModel>();

      tmpSearchList.forEach((element) {
        if (element.name.toLowerCase().contains(query.toLowerCase())) {
          tmpDataList.add(element);
        }
      });
      _listCardModel.clear();
      _listCardModel.addAll(tmpDataList);
    } else {
      _listCardModel.clear();
      _listCardModel.addAll(duplicateList);
    }
  }
}
