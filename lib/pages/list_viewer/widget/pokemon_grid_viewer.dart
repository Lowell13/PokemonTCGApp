import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemontcgviewer/bloc/list_card/list_card_bloc.dart';

import '../../../widget/custom_card.dart';

class PokemonGridViewer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListCardBloc, ListCardState>(
      builder: (context, state) {
        if (state is HasValueListCardState) {
          return GridView.builder(
              itemCount: state.listCard.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
              ),
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              itemBuilder: (context, position) {
                return Card(
                  elevation: 2.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '${state.listCard[position].name}',
                          style: Theme.of(context).textTheme.bodyText2,
                          overflow: TextOverflow.fade,
                          maxLines: 1,
                        ),
                        CustomCard(
                          viewCard: Hero(
                            tag: 'card' + state.listCard[position].id,
                            child: CachedNetworkImage(
                              imageUrl: state.listCard[position].imageUrlHiRes,
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/detailed_view',
                                arguments: state.listCard[position]);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              });
        } else {
          return Text(
              'Seems like your list of cards is empty. How did you get here ?');
        }
      },
    );
  }
}
