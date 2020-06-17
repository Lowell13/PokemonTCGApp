import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemontcgviewer/widget/custom_card.dart';

class ViewBigCard {
  final String _picture;
  final String _id;

  ViewBigCard(this._picture, this._id);
}

class BigCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ViewBigCard _viewBigCard = ModalRoute.of(context).settings.arguments;

    return SafeArea(
      child: SizedBox(
        child: CustomCard(
          viewCard: Hero(
            tag: 'card' + _viewBigCard._id,
            child: CachedNetworkImage(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fitWidth,
              imageUrl: _viewBigCard._picture,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
