// @dart=2.9
import 'package:flutter/material.dart';
import 'package:mobile_1/services/camera_handler.dart';
import 'package:provider/provider.dart';
import 'viewmodels/DrinksListViewModel.dart';
import 'views/HomePageView.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CameraHandler cameraHandler = CameraHandler();
  try {
    cameraHandler.initializeCamera();
    runApp(MyApp());
  } catch(e) {
    print("Camera exception ${e.message}");
  }

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
