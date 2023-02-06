// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:cocktails/models/cocktail.dart';

import 'package:cocktails/ui/pages/common/cocktail_detail_page.dart';

class CocktailListItem extends StatelessWidget {
  final Cocktail cocktail;
  const CocktailListItem({super.key, required this.cocktail});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(cocktail.name!),
        subtitle: Text(cocktail.category!),
        leading: Image.network(cocktail.urlImage!),
        trailing: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(builder: (BuildContext context) {
                return CocktailDetailPage(cocktail: cocktail);
              }),
            );
          },
          icon: Icon(
            Icons.remove_red_eye,
          ),
        ),
      ),
    );
  }
}
