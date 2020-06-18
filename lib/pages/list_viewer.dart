import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemontcgviewer/model/card_model.dart';
import 'package:pokemontcgviewer/pages/custom_search_delegate.dart';
import 'package:pokemontcgviewer/style/colors.dart';
import 'package:pokemontcgviewer/widget/custom_card.dart';

class ListCard {
  final List<CardModel> _listCard;

  List<CardModel> get listCard => _listCard;

  ListCard(this._listCard);
}

class ListViewer extends StatefulWidget {
  @override
  _ListViewerState createState() => _ListViewerState();
}

class _ListViewerState extends State<ListViewer> {
  TextEditingController editingController = TextEditingController();

  List<CardModel> _listCardModel = List<CardModel>();

  @override
  Widget build(BuildContext context) {
    ListCard _listCard = ModalRoute.of(context).settings.arguments;
    final List<CardModel> duplicateList =
        List.unmodifiable(_listCard._listCard);
    if (_listCardModel.isEmpty) {
      _listCardModel.addAll(duplicateList);
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Pokemon Card List',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                    context: context,
                    delegate:
                        CustomSearchDelegate(_listCardModel, duplicateList));
              },
            ),
          ],
        ),
        body: Column(
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
                              overflow: TextOverflow.fade,
                              maxLines: 1,
                            ),
                            CustomCard(
                              viewCard: Hero(
                                tag: 'card' + _listCardModel[position].id,
                                child: CachedNetworkImage(
                                  imageUrl:
                                      _listCardModel[position].imageUrlHiRes,
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
        ),
      ),
    );
  }
}
