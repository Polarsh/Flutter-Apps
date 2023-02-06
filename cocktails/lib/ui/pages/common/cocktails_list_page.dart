// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

import '../../../models/models.dart';
import '../../widgets/widgets.dart';

class CocktailListPage extends StatefulWidget {
  final String title;
  final List<Cocktail> cocktails;
  const CocktailListPage(
      {super.key, required this.title, required this.cocktails});

  @override
  State<CocktailListPage> createState() => CocktailListPageState();
}

class CocktailListPageState extends State<CocktailListPage> {
  //!
  String _search = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(4),
          child: GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: widget.cocktails.length,
            itemBuilder: (context, index) {
              Cocktail cocktail = widget.cocktails[index];
              if (_search.isEmpty ||
                  cocktail.name!
                      .toLowerCase()
                      .contains(_search.toLowerCase())) {
                return CocktailCardItem(
                  cocktail: cocktail,
                );
              }
              return SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
