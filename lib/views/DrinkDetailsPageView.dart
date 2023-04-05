import 'package:flutter/material.dart';
import 'package:mobile1/constant/constants.dart';
import 'package:mobile1/viewmodels/DrinksListViewModel.dart';
import 'package:mobile1/viewmodels/DrinksViewModel.dart';
import 'package:mobile1/views/HomePageView.dart';
import 'package:mobile1/views/PaymentPage.dart';

import 'package:mobile1/widget/SizeOptionItem.dart';
import 'package:provider/provider.dart';

class DrinkDetailScreen extends StatefulWidget {
  DrinksViewModel drink;
  DrinkDetailScreen(this.drink);

  @override
  _DrinkDetailScreenState createState() => _DrinkDetailScreenState();
}

class _DrinkDetailScreenState extends State<DrinkDetailScreen> {
  static var screenHeight;
  static var screenWidth;

  int selectedSize = 0;

  List<String> sizeOptions = ["S", "M", "L"];

  double _value = 2;
  String _status = 'idle';
  Color _statusColor = buttonColor;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Expanded(
            // child:
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        widget.drink.image,
                      ),
                    ),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios_new,
                          size: 20,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
            // ),
            Expanded(
              child: GestureDetector(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 5.0,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: Text(
                        widget.drink.title,
                        style: TextStyle(
                            fontSize: 25.0,
                            color: black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      widget.drink.description,
                      style: TextStyle(
                        color: black,
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "Sucre",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        //  color: Color(0xffaeaeae),
                        color: black,
                      ),
                    ),
                    Slider(
                        min: 0.0,
                        max: 5.0,
                        activeColor: buttonColor,
                        inactiveColor: Color(0xffaeaeae),
                        value: _value,
                        divisions: 5,
                        onChanged: (val) {
                          setState(() {
                            _value = val;
                          });
                        }),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "Taille",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        //  color: Color(0xffaeaeae),
                        color: black,
                      ),
                    ),
                    Container(
                      // width: MediaQuery.of(context).size.width * .5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ...List.generate(sizeOptions.length, (index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedSize = index;
                                });
                              },
                              child: SizeOptionItem(
                                index: index,
                                selected: selectedSize == index ? true : false,
                                sizeOption: sizeOptions[index],
                              ),
                            );
                          })
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Prix",
                              style: TextStyle(
                                color: black,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Row(
                              children: [
                                Text(
                                  "\$\t",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                    color: buttonColor,
                                  ),
                                ),
                                Text(
                                  widget.drink.price,
                                  style: TextStyle(
                                    color: buttonColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        MaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PaymentScreen()),
                            );
                          },
                          height: 55,
                          minWidth: 200,
                          color: buttonColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Text(
                            "Commander",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )),
            )
          ],
        ),
      ),
    );
  }
}
