// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class Vol extends StatefulWidget {
//   const Vol({Key? key}) : super(key: key);

//   @override
//   _HomepageState createState() => _HomepageState();
// }

// class _HomepageState extends State<Vol> {
//   final double _fixedLatitude = 37.4219983;
//   final double _fixedLongitude = -122.084;

//   String location = 'Null, Press Button';
//   String Address = 'search';

//   @override
//   void initState() {
//     super.initState();
//     _getGeoLocationPosition();
//   }

//   Future<Position> _getGeoLocationPosition() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     // Test if location services are enabled.
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       // Location services are not enabled don't continue
//       // accessing the position and request users of the
//       // App to enable the location services.
//       await Geolocator.openLocationSettings();
//       return Future.error('Location services are disabled.');
//     }

//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         // Permissions are denied, next time you could try
//         // requesting permissions again (this is also where
//         // Android's shouldShowRequestPermissionRationale
//         // returned true. According to Android guidelines
//         // your App should show an explanatory UI now.
//         return Future.error('Location permissions are denied');
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       // Permissions are denied forever, handle appropriately.
//       return Future.error(
//           'Location permissions are permanently denied, we cannot request permissions.');
//     }

//     // When we reach here, permissions are granted and we can
//     // continue accessing the position of the device.
//     return await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//   }

//   Future<void> GetAddressFromLatLong(Position position) async {
//     List<Placemark> placemarks =
//         await placemarkFromCoordinates(position.latitude, position.longitude);
//     print(placemarks);
//     Placemark place = placemarks[0];
//     Address =
//         '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';

//     setState(() {});
//   }

//   CameraPosition _initialPosition =
//       CameraPosition(target: LatLng(37.4219999, -122.0840575), zoom: 15);

//   // Map controller
//   late GoogleMapController _mapController;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SizedBox(
//                 height: 100,
//                 width: 500,
//               ),
//               Text(
//                 'Coordinates Points',
//                 style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 location,
//                 style: TextStyle(
//                     color: (location.contains('does not match'))
//                         ? Colors.red
//                         : location.contains('good')
//                             ? Colors.green
//                             : Colors.black,

//                     //color: Colors.black,
//                     fontSize: 16),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 'ADDRESS',
//                 style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Text('${Address}'),
//               ElevatedButton(
//                   onPressed: () async {
//                     Position position = await _getGeoLocationPosition();

//                     // Vérification de la position actuelle
//                     if (position.latitude != _fixedLatitude ||
//                         position.longitude != _fixedLongitude) {
//                       // Affichage de la notification
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(
//                           content: Text(
//                               'La position actuelle est différente de la position fixe.'),
//                         ),
//                       );
//                     }

//                     location =
//                         'Lat: ${position.latitude} , Long: ${position.longitude} ';

//                     GetAddressFromLatLong(position);
//                   },
//                   child: Text('Get Location'))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
