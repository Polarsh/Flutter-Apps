import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/models.dart';

class IngredientServices {
  Future<List<Ingredient>> getAllIngredients() async {
    List<Ingredient> ingredients = [];

    String urlString =
        'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list';

    Uri url = Uri.parse(urlString);
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final maps = jsonResponse['drinks'];

      maps.map((map) {
        ingredients.add(Ingredient.fromJson(map));
      }).toList();

      ingredients.sort((a, b) => a.name.compareTo(b.name));

      return ingredients;
    }
    return ingredients;
  }
}
