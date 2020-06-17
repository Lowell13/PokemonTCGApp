import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemontcgviewer/model/card_model.dart';
import 'package:pokemontcgviewer/pages/custom_search_delegate.dart';
import 'package:pokemontcgviewer/pages/detailed_view.dart';
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

  final TextEditingController _filter = TextEditingController();
  String _searchText = "";
  List names = new List(); // names we get from API
  List filteredNames = new List(); // names filtered by search text
  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text('Search Example');

  List<CardModel> _listCardModel = List<CardModel>();
  //List<CardModel> duplicateList = List<CardModel>();
  @override
  void initState() {
    super.initState();
  }

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          controller: _filter,
          decoration: new InputDecoration(
              prefixIcon: new Icon(Icons.search), hintText: 'Search...'),
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text('Search Example');
        filteredNames = names;
        _filter.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Why should I use a subclass if a parameter without class works ?
    ListCard _listCard = ModalRoute.of(context).settings.arguments;
    final List<CardModel> duplicateList =
        List.unmodifiable(_listCard._listCard);
    if (_listCardModel.isEmpty) {
      _listCardModel.addAll(duplicateList);
    }

    // Try this : https://medium.com/flutterpub/a-simple-search-bar-in-flutter-f99aed68f523
    // Hero tag is sometimes common on Poké Ball

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Pokemon Card List'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              color: Colors.red,
              onPressed: () {
                _searchPressed();
              },
            ),
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
                      color: cardBackgroundColor,
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
                                    arguments: DetailedPokemon(
                                        _listCardModel[position]));
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

  /*void _filterResults(String query, List<CardModel> duplicateList) {
    List<CardModel> tmpSearchList = List<CardModel>();
    tmpSearchList.addAll(duplicateList);

    if (query.isNotEmpty) {
      List<CardModel> tmpDataList = List<CardModel>();

      tmpSearchList.forEach((element) {
        if (element.name.contains(query)) {
          print('-> ${element.name} contains $query');
          tmpDataList.add(element);
        }
      });
      setState(() {
        _listCardModel.clear();
        _listCardModel.addAll(tmpDataList);
      });
    } else {
      setState(() {
        _listCardModel.clear();
        _listCardModel.addAll(duplicateList);
      });
    }
  }*/

  @override
  void dispose() {
    //Clean
    super.dispose();
  }
}
