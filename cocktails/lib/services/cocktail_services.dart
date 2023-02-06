import 'dart:convert';

import 'package:cocktails/models/cocktail.dart';
import 'package:http/http.dart' as http;

class CocktailServices {
  Future<List<Cocktail>> fetchCocktailsByName(String strDrink) async {
    List<Cocktail> cocktails = [];

    String urlString =
        'https://www.thecocktaildb.com/api/json/v1/1/search.php?s=$strDrink';

    Uri url = Uri.parse(urlString);
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final maps = jsonResponse['drinks'];

      maps.map((map) {
        cocktails.add(Cocktail.fromJson(map));
      }).toList();

      return cocktails;
    }
    return cocktails;
  }

  Future<List<Cocktail>> fetchCocktailsByCategory(String strCategory) async {
    List<Cocktail> cocktails = [];

    String urlString =
        'https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=$strCategory';

    Uri url = Uri.parse(urlString);
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final maps = jsonResponse['drinks'];

      maps.map((map) {
        cocktails.add(Cocktail.fromJson(map));
      }).toList();

      return cocktails;
    }
    return cocktails;
  }

  Future<List<Cocktail>> fetchCocktailsByIngredient(
      String strIngredient) async {
    List<Cocktail> cocktails = [];

    String urlString =
        'https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=$strIngredient';

    Uri url = Uri.parse(urlString);
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final maps = jsonResponse['drinks'];

      maps.map((map) {
        cocktails.add(Cocktail.fromJson(map));
      }).toList();

      return cocktails;
    }
    return cocktails;
  }

  Future<Cocktail> fetchCocktailById(String id) async {
    Cocktail cocktail = Cocktail();

    String urlString =
        'https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=$id';

    Uri url = Uri.parse(urlString);
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final maps = jsonResponse['drinks'][0];
      cocktail = Cocktail.fromJson(maps);

      return cocktail;
    }
    return cocktail;
  }
}
