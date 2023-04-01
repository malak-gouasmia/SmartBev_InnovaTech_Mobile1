// @dart=2.9
import 'package:flutter/material.dart';
import 'package:mobile1/viewmodels/DrinksListViewModel.dart';
import 'package:mobile1/views/HomePageView.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => DrinksListViewModel(),
          ),
        ],
        child: DrinksScreen(),
      ),
      routes: {
        "home" : (context) => DrinksScreen()
      }
    );
  }
}
