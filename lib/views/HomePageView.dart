import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile1/constant/constants.dart';
import 'package:mobile1/viewmodels/DrinksListViewModel.dart';
import 'package:mobile1/widget/DrinksGrid.dart';
import 'package:provider/provider.dart';

class DrinksScreen extends StatefulWidget {
  @override
  _DrinksScreenState createState() => _DrinksScreenState();
}

class _DrinksScreenState extends State<DrinksScreen> {
  List<String> Categories = [
    'Tout',
    'Cappucino',
    'Espresso',
    'Latte',
    'Black',
    'Americano',
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<DrinksListViewModel>(context, listen: false).fetchDrinks();
  }

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var drinkslistviewmodel = Provider.of<DrinksListViewModel>(context);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Container(
                width: double.infinity,
                child: Center(
                  child: SvgPicture.asset(
                    'images/logo.svg',
                    color: black,
                    // width: MediaQuery.of(context).size.height * .8,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  itemCount: Categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Text(
                        Categories[index],
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: selectedIndex == index
                                ? buttonColor
                                : Colors.grey.shade700),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: DrinksGrid(drinks: drinkslistviewmodel.drinks),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
