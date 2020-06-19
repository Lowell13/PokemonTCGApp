import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemontcgviewer/bloc/theme_picker/theme_picker_bloc.dart';
import 'package:pokemontcgviewer/pages/list_viewer/search_function/custom_search_delegate.dart';
import 'package:pokemontcgviewer/pages/list_viewer/widget/pokemon_grid_viewer.dart';

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
          DropdownButton(
            icon: Icon(Icons.settings),
            items: <String>["Paint it Black", "My Little Pony"]
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String newTheme) {
              if (newTheme == "Paint it Black") {
                BlocProvider.of<ThemePickerBloc>(context)
                    .add(ChangeThemePickerEvent(PibThemePickerState()));
              } else {
                BlocProvider.of<ThemePickerBloc>(context)
                    .add(ChangeThemePickerEvent(MlpThemePickerState()));
              }
            },
            underline: Container(),
          ),
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
