import 'package:flutter/material.dart';
import 'package:mobile_1/Vues/page_configuration_AM.dart';
import 'package:mobile_1/Vues/page_pub.dart';

class CodeAM extends StatefulWidget {
  @override
  _CodeAMState createState() => _CodeAMState();
}

class _CodeAMState extends State<CodeAM> {
  final List<TextEditingController> _controllers = List.generate(
    5,
    (index) => TextEditingController(),
  );

  String _getCode() {
    return _controllers.map((controller) => controller.text).join();
  }

  @override
  void dispose() {
    _controllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 235, 219, 205)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: screenSize.width > 480
                        ? screenSize.width * 0.04
                        : screenSize.width * 0.1,
                    width: screenSize.width,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(Icons.clear),
                        iconSize: 45,
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => Pub()),
                          );
                        },
                      ),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                  Image.asset('assets/images/logo2.png'),
                  SizedBox(
                    height: screenSize.width > 480
                        ? screenSize.width * 0.04
                        : screenSize.width * 0.1,
                    width: screenSize.width,
                  ),
                  Text(
                    "Espace de Maintenance",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenSize.width > 480 ? 35 : 20,
                      // height: 2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: screenSize.width > 480
                        ? screenSize.width * 0.04
                        : screenSize.width * 0.1,
                    width: screenSize.width,
                  ),
                  Text(
                    "Entrer votre code pour déverrouiller le distributeur",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: screenSize.width > 480 ? 28 : 20,
                      height: 2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: screenSize.width > 480
                        ? screenSize.width * 0.1
                        : screenSize.width * 0.25,
                    width: screenSize.width,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(
                          5,
                          (index) => SizedBox(
                            width: screenSize.width > 480 ? 60 : 50,
                            child: TextField(
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: Color.fromARGB(255, 101, 74, 51),
                              ),
                              controller: _controllers[index],
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              maxLength: 1,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color.fromARGB(255, 210, 121, 66)
                                    .withOpacity(0.2),
                                counterText: '',
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 210, 121, 66),
                                    width: 2.0,
                                  ),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 16,
                                ),
                              ),
                              cursorColor: Color.fromARGB(255, 210, 121, 66),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenSize.width > 480
                            ? screenSize.width * 0.15
                            : screenSize.width * 0.2,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 210, 121, 66),
                          padding: EdgeInsets.symmetric(
                              horizontal: 60, vertical: 16),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {
                          String code = _getCode();
                          if (code == "12345") {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => ConfigurationAM()),
                            );
                          } else {
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                backgroundColor:
                                    Color.fromARGB(255, 235, 219, 205),
                                title: Text(
                                  'Code erroné',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                content: Text(
                                  'Veuillez saisir un code valide',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                                actions: [
                                  ButtonBar(
                                    children: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text(
                                          'OK',
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 253, 253, 253),
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              Color.fromARGB(255, 210, 121, 66),
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 20,
                                            vertical: 14,
                                          ),
                                          elevation: 5,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }
                          ;
                        },
                        child: Text(
                          'Valider',
                          style: TextStyle(
                            fontSize: screenSize.width > 480 ? 25 : 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenSize.width > 480
                            ? screenSize.width * 0.1
                            : screenSize.width * 0.365,
                      ),
                    ],
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
