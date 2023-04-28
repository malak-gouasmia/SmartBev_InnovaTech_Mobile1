import '../models/DrinkModel.dart';

class DrinksViewModel {
  DrinkModel _drinkModel;

  DrinksViewModel({required DrinkModel drink}) : _drinkModel = drink;

  int get id {
    return _drinkModel.id;
  }

  String get title {
    return _drinkModel.title;
  }

  String get description {
    return _drinkModel.description;
  }

  double get price {
    return _drinkModel.price;
  }

  String get image {
    return _drinkModel.image;
  }

  // String get ingredients {
  //   return _drinkModel.ingredients;
  // }
}
