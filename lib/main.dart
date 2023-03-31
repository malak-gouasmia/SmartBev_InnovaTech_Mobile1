import 'package:mobile_1/Vues/page_configuration_AM.dart';

import 'Vues/page_code_AM.dart';
import 'Vues/page_pub.dart';

import 'package:flutter/material.dart';

import 'Vues/page_bon_appetit.dart';

import 'Vues/vol.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' CUPPA',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: //vol(),
          //  BonAppetit(),
          CodeAM(),
      //  Pub(),
      // ConfigurationAM(),
    );
  }
}
//EBDBCD
