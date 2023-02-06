class Ingredient {
  final String name;
  final String urlImage;

  Ingredient({
    required this.name,
    required this.urlImage,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        name: json['strIngredient1'] ?? 'strIngredient1',
        urlImage:
            'https://www.thecocktaildb.com/images/ingredients/${json['strIngredient1']}-Small.png',
      );
}
