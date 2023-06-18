import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/constants.dart';
import '../models/CommandModel.dart';
import '../viewmodels/CommandViewModel.dart';
import '../viewmodels/DrinksViewModel.dart';
import '../widgets/SizeOptionItem.dart';
import 'PaymentPage.dart';

class DrinkDetailScreen extends StatefulWidget {
  DrinksViewModel drink;

  DrinkDetailScreen(this.drink);

  @override
  _DrinkDetailScreenState createState() => _DrinkDetailScreenState();
}

class _DrinkDetailScreenState extends State<DrinkDetailScreen> {
  late Command _command;
  int _selectedSize = 0;
  late double price;

  List<String> sizeOptions = ["S", "M", "L"];

  double _value = 2; //sucre

   @override
  void initState() {
    super.initState();
    price = widget.drink.price;
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: screenSize.width > 480
                      ? screenSize.width * 0.4
                      : screenSize.width * 0.8,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        './assets/' + widget.drink.image,
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
            GestureDetector(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // SizedBox(
                  //   height: 5.0,
                  // ),
                  SizedBox(
                    height: screenSize.width > 480
                        ? screenSize.width * 0.04
                        : screenSize.width * 0.1,
                    width: screenSize.width,
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(
                      widget.drink.title,
                      style: TextStyle(
                          fontSize: screenSize.width > 480 ? 30 : 25,
                          color: black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    widget.drink.description,
                    style: TextStyle(
                      fontSize: screenSize.width > 480 ? 18 : 16,
                      color: black,
                    ),
                  ),
                  // SizedBox(
                  //   height: 5.0,
                  // ),
                  SizedBox(
                    height: screenSize.width > 480
                        ? screenSize.width * 0.04
                        : screenSize.width * 0.1,
                    width: screenSize.width,
                  ),
                  Text(
                    "Sucre",
                    style: TextStyle(
                      fontSize: screenSize.width > 480 ? 25 : 20,
                      fontWeight: FontWeight.bold,
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
                      label: '${_value.round()}',
                      onChanged: (val) {
                        setState(() {
                          _value = val;
                        });
                      }),

                  SizedBox(
                    height: screenSize.width > 480
                        ? screenSize.width * 0.04
                        : screenSize.width * 0.1,
                    width: screenSize.width,
                  ),
                  Text(
                    "Taille",
                    style: TextStyle(
                      fontSize: screenSize.width > 480 ? 25 : 20,
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
                                _selectedSize = index;
                                price =
                                    widget.drink.price * (_selectedSize + 1);
                              });
                            },
                            child: SizeOptionItem(
                              index: index,
                              selected: _selectedSize == index ? true : false,
                              sizeOption: sizeOptions[index],
                            ),
                          );
                        })
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   height: 5.0,
                  // ),
                  SizedBox(
                    height: screenSize.width > 480
                        ? screenSize.width * 0.04
                        : screenSize.width * 0.1,
                    width: screenSize.width,
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
                              fontSize: screenSize.width > 480 ? 25 : 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // SizedBox(
                          //   height: 3,
                          // ),
                          // SizedBox(
                          //   height: screenSize.width > 480
                          //       ? screenSize.width * 0.002
                          //       : screenSize.width * 0.01,
                          //   width: screenSize.width,
                          // ),
                          Row(
                            children: [
                              Text(
                                "\$\t",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenSize.width > 480 ? 25 : 20,
                                  color: buttonColor,
                                ),
                              ),
                              Text(
                                price.toString(),
                                style: TextStyle(
                                  color: buttonColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenSize.width > 480 ? 25 : 20,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      MaterialButton(
                        onPressed: () async {
                          _command = Command(
                              time: DateTime.now().toString(),
                              quantity_sugar: _value,
                              price: price,
                              size: _selectedSize + 1,
                              num_serie_destributeur: "ABDCRT",
                              id_boisson: widget.drink.id);

                          final commandId =
                              await CommandViewModel().createCommand(_command);
                          print("the id of the created boisson ");
                          print(commandId);
                          print("sugar ius");
                          print(_command.quantity_sugar);
                          print("size");
                          print(_command.size);
                          print("price");
                          print(price);

                          Map<String, dynamic> commandJson = _command.toJson();
                          print(commandJson.toString());
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    PaymentScreen(commandId, commandJson)),
                          );
                        },
                        height: screenSize.width > 480
                            ? screenSize.width * 0.09
                            : screenSize.width * 0.15,
                        minWidth: screenSize.width * 0.5,
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
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
