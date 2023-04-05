import 'package:flutter/cupertino.dart';
import 'package:mobile1/models/DrinkModel.dart';
import 'package:mobile1/services/Test.dart';
import 'package:mobile1/viewmodels/DrinksViewModel.dart';


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
    
    List<DrinkModel> _drinks = await TestAPI().getDrinks();
   
    loadingStatus = LoadingStatus.Searching;
    notifyListeners();
    this.drinks = _drinks.map((drink) => DrinksViewModel(drink: drink)).toList();

    if (this.drinks.isEmpty) {

      loadingStatus = LoadingStatus.Empty;
    } else {
      loadingStatus = LoadingStatus.Completed;
    }

    notifyListeners();
  }
}
