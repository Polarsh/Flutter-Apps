// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';

import '../../../models/models.dart';
import '../../../services/services.dart';
import '../pages.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  late final List<Category> categories;

  @override
  void initState() {
    categories = CategoryServices().getCategories();
    super.initState();
  }

  goToListPage(categoryName) async {
    List<Cocktail> cocktailList =
        await CocktailServices().fetchCocktailsByCategory(categoryName);

    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (BuildContext context) {
        return CocktailListPage(
          title: categoryName,
          cocktails: cocktailList,
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        padding: EdgeInsets.all(4),
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          Category category = categories[index];
          return Padding(
            padding: EdgeInsets.all(4),
            child: InkWell(
              onTap: () {
                goToListPage(category.name);
              },
              child: GridTile(
                footer: Material(
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(4)),
                  ),
                  color: Colors.transparent,
                  child: GridTileBar(
                    backgroundColor: Colors.black45,
                    title: Text(category.name),
                  ),
                ),
                child: Image.network(category.urlImage),
              ),
            ),
          );
        },
      ),
    );
  }
}
