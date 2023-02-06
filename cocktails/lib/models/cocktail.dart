class Cocktail {
  final String? id;
  final String? name;
  final String? category;
  final String? urlImage;
  final String? instructionsEN;
  final String? instructionsDE;
  final String? instructionsIT;

  Cocktail({
    this.id,
    this.name,
    this.category,
    this.urlImage,
    this.instructionsEN,
    this.instructionsDE,
    this.instructionsIT,
  });

  factory Cocktail.fromJson(Map<String, dynamic> json) => Cocktail(
        id: json['idDrink'] ?? 'id',
        name: json['strDrink'] ?? 'strDrink',
        category: json['strCategory'] ?? 'strCategory',
        urlImage: json['strDrinkThumb'] ?? 'strDrinkThumb',
        instructionsEN: json['strInstructions'] ?? 'null',
        instructionsDE: json['strInstructionsDE'] ?? 'null',
        instructionsIT: json['strInstructionsIT'] ?? 'null',
      );
}
