// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';

import '../../../models/models.dart';
import '../../../services/services.dart';
import '../pages.dart';

class IngredientsPage extends StatefulWidget {
  const IngredientsPage({super.key});

  @override
  State<IngredientsPage> createState() => _IngredientsPageState();
}

class _IngredientsPageState extends State<IngredientsPage> {
  String _search = '';

  List<Ingredient> ingredients = [];
  List<Ingredient> searchedIngredients = [];

  goToListPage(strIngredient) async {
    List<Cocktail> cocktailList =
        await CocktailServices().fetchCocktailsByIngredient(strIngredient);

    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (BuildContext context) {
        return CocktailListPage(
          title: strIngredient,
          cocktails: cocktailList,
        );
      }),
    );
  }

  Future<List<Ingredient>> getAllIngredients() async {
    ingredients = await IngredientServices().getAllIngredients();
    return ingredients;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //!Search
          Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search...',
                  ),
                  onChanged: (val) {
                    setState(
                      () {
                        _search = val;
                      },
                    );
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Ingredient>>(
              future: getAllIngredients(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                searchedIngredients = ingredients
                    .where((ingredient) => ingredient.name
                        .toLowerCase()
                        .contains(_search.toLowerCase()))
                    .toList();
                return GridView.builder(
                  padding: EdgeInsets.all(4),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 2.5,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                  ),
                  itemCount: searchedIngredients.length,
                  itemBuilder: (context, index) {
                    Ingredient ingredient = searchedIngredients[index];

                    return ingredientItem(ingredient);
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget ingredientItem(Ingredient ingredient) {
    return Card(
      child: InkWell(
        onTap: () {
          goToListPage(ingredient.name);
        },
        child: Center(
          child: Text(
            ingredient.name,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
