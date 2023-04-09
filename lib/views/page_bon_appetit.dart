import 'package:flutter/material.dart';

class BonAppetit extends StatefulWidget {
  @override
  _BonAppetitState createState() => _BonAppetitState();
}

class _BonAppetitState extends State<BonAppetit> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  // color:Color.fromARGB(4, 4, 4, 4)
                  color: Color.fromRGBO(232, 213, 196, 0.612)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: screenSize.width > 480
                        ? screenSize.width * 0.05
                        : screenSize.width * 0.1,
                    width: screenSize.width,
                  ),
                  Image.asset('assets/images/logo.png'),
                  SizedBox(
                    height: screenSize.width > 480
                        ? screenSize.width * 0.05
                        : screenSize.width * 0.1,
                  ),
                  Text(
                    "Votre boisson est prete",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenSize.width > 480 ? 30 : 22,
                        shadows: [
                          Shadow(
                            offset: Offset(0.5, 0.5),
                            blurRadius: 50,
                          )
                        ]),
                  ),
                  SizedBox(
                    height: screenSize.width > 480
                        ? screenSize.width * 0.05
                        : screenSize.width * 0.1,
                  ),
                  Image.asset('assets/images/cuppBonAppetit.png'),
                  Image.asset('assets/images/bonAppetit.png'),
                  SizedBox(
                    height: screenSize.width > 480
                        ? screenSize.width * 0.08
                        : screenSize.width * 0.07,
                    width: screenSize.width,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
