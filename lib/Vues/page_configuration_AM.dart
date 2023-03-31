import 'package:flutter/material.dart';
import 'page_code_AM.dart';

class ConfigurationAM extends StatefulWidget {
  @override
  _ConfigurationAMState createState() => _ConfigurationAMState();
}

class _ConfigurationAMState extends State<ConfigurationAM> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              decoration:
                  BoxDecoration(color: Color.fromRGBO(232, 213, 196, 0.612)),
              child: Column(
                children: [
                  SizedBox(
                    height: screenSize.width > 480
                        ? screenSize.width * 0.08
                        : screenSize.width * 0.15,
                    width: screenSize.width,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            "Cuppa Espace Maintenance",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: screenSize.width > 480 ? 35 : 30,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromRGBO(232, 213, 196, 1),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(1, 4),
                                blurRadius: 8,
                              ),
                            ],
                          ),
                          child: IconButton(
                            icon: Icon(Icons.exit_to_app),
                            iconSize: 45,
                            color: Colors.brown,
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => CodeAM()),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenSize.width > 480
                        ? screenSize.width * 0.05
                        : screenSize.width * 0.08,
                    width: screenSize.width,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0x664B33).withOpacity(1),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(3, 4),
                                  blurRadius: 4,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: IconButton(
                                icon: Icon(
                                  Icons.restart_alt_outlined,
                                  size: 40,
                                  color: Color.fromARGB(255, 236, 231, 231),
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Reload",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0x664B33).withOpacity(1),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(3, 4),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: IconButton(
                                icon: Icon(
                                  Icons.settings_power,
                                  size: 40,
                                  color: Color.fromARGB(255, 236, 231, 231),
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Power_off",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenSize.width * 0.01,
                    width: screenSize.width,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: screenSize.width > 480
                            ? screenSize.width * 0.08
                            : screenSize.width * 0.08,
                      ),
                      Text(
                        "Liquides",
                        style: TextStyle(
                          fontSize: screenSize.width > 480 ? 25 : 30,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: screenSize.height * 0.015,
                  ),
                  /****************************** */
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(
                          width: screenSize.width * 0.1,
                        ),
                        card_liquide(
                          screenSize: screenSize,
                          temp: "30 C",
                          nom: 'Lait',
                          path: "assets/images/lait.png",
                          max: 5,
                          size: 3,
                        ),
                        SizedBox(
                          width: screenSize.width * 0.1,
                        ),
                        card_liquide(
                          screenSize: screenSize,
                          temp: "20 C",
                          nom: 'Eau',
                          path: "assets/images/eau.png",
                          size: 4,
                          max: 5,
                        ),
                        SizedBox(
                          width: screenSize.width * 0.1,
                        ),
                        card_liquide(
                          screenSize: screenSize,
                          temp: "25 C",
                          nom: 'Caffe',
                          path: "assets/images/bottle.png",
                          size: 2.5,
                          max: 5,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenSize.width * 0.1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: screenSize.width > 480
                            ? screenSize.width * 0.08
                            : screenSize.width * 0.08,
                      ),
                      Text(
                        "Secs",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: screenSize.height * 0.015,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(
                          width: screenSize.width * 0.1,
                        ),
                        card_sec(
                          screenSize: screenSize,
                          nom: 'sucre',
                          path: "assets/images/sucre.png",
                          max: 150,
                          size: 125,
                        ),
                        SizedBox(
                          width: screenSize.width * 0.05,
                        ),
                        card_sec(
                          screenSize: screenSize,
                          nom: 'Sucre roux',
                          path: "assets/images/sucre.png",
                          size: 20,
                          max: 100,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenSize.width * 0.1,
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

class card_liquide extends StatelessWidget {
  const card_liquide({
    required this.nom,
    required this.path,
    required this.temp,
    required this.screenSize,
    required this.max,
    required this.size,
    Key? key,
  }) : super(key: key);
  final String nom;
  final String path;
  final String temp;
  final screenSize;
  final double max;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 0,
      ),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color.fromARGB(255, 228, 191, 166),
            boxShadow: [
              BoxShadow(
                offset: Offset(1.5, 1),
                blurRadius: 8,
              ),
            ]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: screenSize.width > 480
                          ? screenSize.width * 0.13
                          : screenSize.width * 0.23,
                      width: screenSize.width > 480
                          ? screenSize.width * 0.13
                          : screenSize.width * 0.23,
                      decoration: BoxDecoration(
                        color: Color(0x664B33).withOpacity(0.3),
                        borderRadius: BorderRadius.circular(60),
                      ),
                      child: Image.asset(this.path),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  nom,
                  style: TextStyle(
                    fontSize: screenSize.width > 480 ? 28 : 23,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 15,
              ),
              Text(
                temp,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 35),
              Container(
                height: screenSize.width > 480
                    ? screenSize.width * 0.15
                    : screenSize.width * 0.2,
                width: screenSize.width > 480
                    ? screenSize.width * 0.15
                    : screenSize.width * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(90)),
                ),
                child: CircularProgressIndicator(
                  strokeWidth: 6,
                  value: size / max,
                  backgroundColor: Color.fromARGB(255, 160, 157, 157),
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color.fromARGB(255, 234, 135, 23),
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(
                  screenSize.width > 480
                      ? screenSize.width * -0.09
                      : screenSize.width * -0.14,
                  screenSize.width > 480
                      ? screenSize.width * 0.001
                      : screenSize.width * 0.01,
                ),
                child: Text(
                  '${(size / max * 100).toStringAsFixed(0)}%',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
              SizedBox(width: 3),
            ],
          ),
          SizedBox(height: 20),
        ]),
      ),
    );
  }
}

class card_sec extends StatelessWidget {
  const card_sec({
    required this.nom,
    required this.path,
    required this.screenSize,
    required this.max,
    required this.size,
    Key? key,
  }) : super(key: key);
  final String nom;
  final String path;

  final screenSize;
  final double max;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: Offset(1.5, 1),
                blurRadius: 8,
              ),
            ],
            borderRadius: BorderRadius.circular(20),
            color: Color.fromARGB(255, 228, 191, 166)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20),
            child: Column(
              children: [
                Container(
                  height: screenSize.width > 480
                      ? screenSize.width * 0.13
                      : screenSize.width * 0.23,
                  width: screenSize.width > 480
                      ? screenSize.width * 0.13
                      : screenSize.width * 0.23,
                  decoration: BoxDecoration(
                    color: Color(0x664B33).withOpacity(0.3),
                    borderRadius: BorderRadius.circular(90),
                  ),
                  child: Image.asset(this.path),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  nom,
                  style: TextStyle(
                    fontSize: screenSize.width > 480 ? 28 : 23,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 15,
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '${size} g/ ',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              Text(
                '${max} g',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 0.0,
              horizontal: 10,
            ),
            child: Container(
              height: 13,
              width: screenSize.width * 0.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(90)),
              ),
              child: LinearProgressIndicator(
                value: size / max,
                backgroundColor: Color.fromARGB(255, 160, 157, 157),
                valueColor: AlwaysStoppedAnimation<Color>(
                  Color.fromARGB(255, 234, 135, 23),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
        ]),
      ),
    );
  }
}
