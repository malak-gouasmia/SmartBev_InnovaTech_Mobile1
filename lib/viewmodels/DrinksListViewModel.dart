import 'package:flutter/cupertino.dart';

import '../models/DrinkModel.dart';
import '../services/DrinksService.dart';
import '../services/Test.dart';
import 'DrinksViewModel.dart';

enum LoadingStatus {
  Completed,
  Searching,
  Empty,
}

class DrinksListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.Empty;
  List<DrinksViewModel> drinks = <DrinksViewModel>[];

  // methods to fetch drinks
  void fetchDrinks() async {
    // List<DrinkModel> _drinks = await TestAPI().getDrinks();
    List<DrinkModel> _drinks = await DrinksAPI.getAllDrinks();
    print(_drinks);

    loadingStatus = LoadingStatus.Searching;
    notifyListeners();
    this.drinks =
        _drinks.map((drink) => DrinksViewModel(drink: drink)).toList();

    if (this.drinks.isEmpty) {
      loadingStatus = LoadingStatus.Empty;
    } else {
      loadingStatus = LoadingStatus.Completed;
    }

    notifyListeners();
  }
}
