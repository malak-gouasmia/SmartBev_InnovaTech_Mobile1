

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';



class DetectionService {
  static const baseUrl = 'http://192.168.1.4:8000';

  Future sendFace(CameraImage cameraImage) async {
    const url = '$baseUrl/commandes'; //CHANGE


    final request = http.MultipartRequest('POST', Uri.parse(url));
    final byteData = cameraImage.planes.map((plane) => plane.bytes).toList();
    final bytes = Uint8List.fromList(byteData.expand((element) => element).toList());

    final multipartFile = http.MultipartFile.fromBytes('image', bytes,
        filename: 'image.jpg', contentType: MediaType('image', 'jpeg'));

    request.files.add(multipartFile);

    print("\n \n \n Face Format <3 \n\n ");

    final response = await request.send();

    if (response.statusCode == 201) {
      print('Command created successfully');
    } else {
      throw Exception('Failed to send face');
    }
  }

}