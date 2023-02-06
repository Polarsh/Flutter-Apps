import 'package:cocktails/models/category.dart';

class CategoryServices {
  getCategories() {
    List<Category> categories = [
      Category(
          name: 'Ordinary Drink',
          urlImage:
              'https://www.thecocktaildb.com/images/media/drink/wwpyvr1461919316.jpg'),
      Category(
          name: 'Cocktail',
          urlImage:
              'https://www.thecocktaildb.com/images/media/drink/wysqut1461867176.jpg'),
      Category(
          name: 'Shake',
          urlImage:
              'https://www.thecocktaildb.com/images/media/drink/vqquwx1472720634.jpg'),
      Category(
          name: 'Other / Unknown',
          urlImage:
              'https://www.thecocktaildb.com/images/media/drink/tqxyxx1472719737.jpg'),
      Category(
          name: 'Cocoa',
          urlImage:
              'https://www.thecocktaildb.com/images/media/drink/xcu6nb1487603142.jpg'),
      Category(
          name: 'Shot',
          urlImage:
              'https://www.thecocktaildb.com/images/media/drink/rtpxqw1468877562.jpg'),
      Category(
          name: 'Coffee / Tea',
          urlImage:
              'https://www.thecocktaildb.com/images/media/drink/vqwptt1441247711.jpg'),
      Category(
          name: 'Homemade Liqueur',
          urlImage:
              'https://www.thecocktaildb.com/images/media/drink/qwxuwy1472667570.jpg'),
      Category(
          name: 'Punch / Party Drink',
          urlImage:
              'https://www.thecocktaildb.com/images/media/drink/xrqxuv1454513218.jpg'),
      Category(
          name: 'Beer',
          urlImage:
              'https://www.thecocktaildb.com/images/media/drink/wwuvxv1472668899.jpg'),
      Category(
          name: 'Soft Drink',
          urlImage:
              'https://www.thecocktaildb.com/images/media/drink/sxxsyq1472719303.jpg'),
    ];
    return categories;
  }
}
