// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:cocktails/models/cocktail.dart';

import 'package:cocktails/ui/pages/common/cocktail_detail_page.dart';

class CocktailCardItem extends StatelessWidget {
  final Cocktail cocktail;
  const CocktailCardItem({super.key, required this.cocktail});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<void>(builder: (BuildContext context) {
            return CocktailDetailPage(cocktail: cocktail);
          }),
        );
      },
      child: Card(
        child: GridTile(
          footer: Material(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(4)),
            ),
            color: Colors.transparent,
            child: GridTileBar(
              backgroundColor: Colors.black45,
              title: Text(cocktail.name!),
            ),
          ),
          child: Image.network(cocktail.urlImage!),
        ),
      ),
    );
  }
}
