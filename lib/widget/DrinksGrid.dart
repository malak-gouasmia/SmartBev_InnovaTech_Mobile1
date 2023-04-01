import 'package:flutter/material.dart';
import 'package:mobile1/viewmodels/DrinksViewModel.dart';
import 'package:mobile1/views/DrinkDetailsPageView.dart';
import 'package:mobile1/widget/CircleImage.dart';

class DrinksGrid extends StatelessWidget {
  List<DrinksViewModel> drinks;
  DrinksGrid({required this.drinks});

  void _ShowDrinkDetailPage(BuildContext context, DrinksViewModel vm) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return DrinkDetailScreen(vm);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        //added
        childAspectRatio: 0.6,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        //
      ),
      itemBuilder: (_, index) {
        var drink = drinks[index];

        return GestureDetector(
          onTap: () {
            _ShowDrinkDetailPage(context, drink);
          },
          child: GridTile(
            child: Container(
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(0),
              // ),
              child: CircleImage(
                  imageUrl: drink.image,
                  ingredients: drink.ingredients,
                  title: drink.title,
                  price: drink.price),
            ),
          ),
        );
      },
      itemCount: drinks.length,
    );
  }
}
