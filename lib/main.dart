// @dart=2.9
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobile_1/views/vol2.dart';
import 'package:provider/provider.dart';
import 'package:workmanager/workmanager.dart';

import 'viewmodels/DrinksListViewModel.dart';
import 'views/HomePageView.dart';

final double _fixedLatitude = 36.6868963;
final double _fixedLongitude = 2.9684808;
bool _locationMatch = true;
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
        routes: {"home": (context) => DrinksScreen()});
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(minutes: 1), (timer) {
      _getGeoLocationPosition().then((value) {
        setState(() {
          _locationMatch = _checkLocation(value) as bool;
          print(_locationMatch); // Print locationMatch to the console
        });
      });
    });
  }
}

Future<Position> _getGeoLocationPosition() async {
  bool serviceEnabled;
  LocationPermission permission;
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    await Geolocator.openLocationSettings();
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  Position currentPosition = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
  if (currentPosition != null) {
    double distanceInMeters = await Geolocator.distanceBetween(
      currentPosition.latitude,
      currentPosition.longitude,
      _fixedLatitude,
      _fixedLongitude,
    );
    if (distanceInMeters < 100) {
      print("here is a match");
      _locationMatch = true;
    } else {
      print("here is a change");
      _locationMatch = false;
    }
  }

  return currentPosition;
}

Future<bool> _checkLocation(Position position) async {
  // Position position = await _getGeoLocationPosition();
  if (position != null) {
    double distanceInMeters = await Geolocator.distanceBetween(
      position.latitude,
      position.longitude,
      _fixedLatitude,
      _fixedLongitude,
    );
    print(distanceInMeters);
    if (distanceInMeters < 100) {
      // do something if the current position is within 100 meters of the fixed position
      print("here is a match");

      return true;
    } else {
      print("here is a change");

      return false;
    }
  }
}
