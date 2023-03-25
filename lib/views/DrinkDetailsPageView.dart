import 'package:flutter/material.dart';
import 'package:mobile1/constant/constants.dart';
import 'package:mobile1/viewmodels/DrinksListViewModel.dart';
import 'package:mobile1/viewmodels/DrinksViewModel.dart';

import 'package:mobile1/widget/SizeOptionItem.dart';
import 'package:provider/provider.dart';

class DrinkDetailScreen extends StatelessWidget {
  DrinksViewModel drink;
  DrinkDetailScreen(this.drink);

  static var screenHeight;
  static var screenWidth;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 440,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          this.drink.image,
                        ),
                      ),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // MultiProvider(
                        // providers: [
                        //   ChangeNotifierProvider(
                        //     create: (_) => DrinksListViewModel(),
                        //   ),
                        // ],
                        // child: IconButton(
                        //   icon: Icon(
                        //     Icons.arrow_back_ios_new,
                        //     size: 20,
                        //     color: Colors.white,
                        //   ),
                        //   onPressed: () {
                        //     Navigator.of(context).push(MaterialPageRoute(
                        //         builder: (context) => DrinksScreen()));
                        //   },
                        // ),
                        // ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      this.drink.title,
                      style: TextStyle(
                          fontSize: 25.0,
                          color: black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      this.drink.description,
                      style: TextStyle(
                        color: black,
                      ),
                    ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        SizeOptionItem(
                          index: 0,
                          selected: true,
                          sizeOption: "S",
                        ),
                        SizeOptionItem(
                          index: 1,
                          selected: false,
                          sizeOption: "M",
                        ),
                        SizeOptionItem(
                          index: 2,
                          selected: false,
                          sizeOption: "L",
                        ),
                      ],
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
                                  this.drink.price,
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
                          onPressed: () {},
                          height: 55,
                          minWidth: 200,
                          color: Color(0xffd17842),
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
