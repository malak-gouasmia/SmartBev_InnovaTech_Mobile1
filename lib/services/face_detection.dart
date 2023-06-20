

import 'package:google_ml_kit/google_ml_kit.dart';


class FaceDetection {
  FaceDetector faceDetector =
  GoogleMlKit.vision.faceDetector(FaceDetectorOptions(
    enableContours: true,
    enableClassification: true,
  ));

  bool isBusy = false;


  Future<void> disposeDetector() async {
    await faceDetector.close();
  }

  Future<bool> processInputImage(InputImage inputImage) async {
    if (isBusy) return false;
    isBusy = true;
    final faces = await faceDetector.processImage(inputImage);
    isBusy = false;

    return faces.isEmpty ? false : true;

  }


}