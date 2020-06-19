import 'package:flutter/material.dart';
import 'package:pokemontcgviewer/pages/custom_search_delegate.dart';
import 'package:pokemontcgviewer/widget/pokemon_grid_viewer.dart';

class ListViewer extends StatefulWidget {
  @override
  _ListViewerState createState() => _ListViewerState();
}

class _ListViewerState extends State<ListViewer> {
  TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
          ),
        ],
      ),
      body: PokemonGridViewer(),
    ));
  }
}
