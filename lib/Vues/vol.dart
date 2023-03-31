/*import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class vol extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<vol> {
  bool _isMoving = false;

  @override
  void initState() {
    super.initState();
    accelerometerEvents.listen((AccelerometerEvent event) {
      if (event.x.abs() > 1.0 || event.y.abs() > 1.0 || event.z.abs() > 1.0) {
        setState(() {
          _isMoving = true;
        });
      } else {
        setState(() {
          _isMoving = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            _isMoving
                ? 'Le téléphone est en mouvement'
                : 'Le téléphone est immobile',
            style: TextStyle(fontSize: 24.0),
          ),
        ),
      ),
    );
  }
}
*/