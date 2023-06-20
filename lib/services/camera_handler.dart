import 'dart:io';

import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:camera/camera.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'face_detection.dart';
import 'detectionService.dart';

class CameraHandler {
  late CameraController controller;
  late CameraDescription frontCamera;

  Future<void> initializeCamera() async {
    bool HasBeenDetected = false; //used to make sure one pic is saved at a time

    final PermissionStatus status = await Permission.camera.request();

    if (status.isGranted) {
      final cameras = await availableCameras();
      frontCamera = cameras.firstWhere(
            (camera) => camera.lensDirection == CameraLensDirection.front,
        orElse: () => cameras.first,
      );


      controller = CameraController(frontCamera, ResolutionPreset.low, enableAudio: false);
      await controller.initialize();

      controller.startImageStream((CameraImage cameraImage) async {
        InputImage inputImage = await processCameraImage(cameraImage);
        if (await FaceDetection().processInputImage(inputImage)) {
          if (HasBeenDetected == false) {
            print("\n \nfaces\n \n");
            await DetectionService().sendFace(cameraImage);
            HasBeenDetected = true;
          } else {
            print("\n \nno faces\n \n");
            HasBeenDetected = false;
          }
        }
      });
    } else {
      throw CameraPermissionException('Camera permission not granted');
    }
  }



  Future<InputImage> processCameraImage(CameraImage image) async {
    final WriteBuffer allBytes = WriteBuffer();
    for (Plane plane in image.planes) {
      allBytes.putUint8List(plane.bytes);
    }
    final bytes = allBytes.done().buffer.asUint8List();

    final Size imageSize =
    Size(image.width.toDouble(), image.height.toDouble());


    InputImageRotation rotationFromCamera(int sensorOrientation) {
      switch (sensorOrientation) {
        case 0:
          return InputImageRotation.rotation0deg;
        case 90:
          return InputImageRotation.rotation90deg;
        case 180:
          return InputImageRotation.rotation180deg;
        case 270:
          return InputImageRotation.rotation270deg;
        default:
          return InputImageRotation.rotation0deg;
      }
    }
    final int sensorOrientation = frontCamera.sensorOrientation;
    final InputImageRotation imageRotation = rotationFromCamera(sensorOrientation);


    final inputImageFormat =
        InputImageFormatValue.fromRawValue(image.format.raw) ??
            InputImageFormat.nv21;

    final planeData = image.planes.map(
          (Plane plane) {
        return InputImagePlaneMetadata(
          bytesPerRow: plane.bytesPerRow,
          height: plane.height,
          width: plane.width,
        );
      },
    ).toList();

    final inputImageData = InputImageData(
      size: imageSize,
      imageRotation: imageRotation,
      inputImageFormat: inputImageFormat,
      planeData: planeData,
    );
    return InputImage.fromBytes(bytes: bytes, inputImageData: inputImageData);
  }







  Future<void> disposeCamera() async {
    await controller.dispose();
  }

}

















class CameraPermissionException implements Exception {
  final String message;

  CameraPermissionException(this.message);
}

class CameraNotFoundException implements Exception {
  final String message;

  CameraNotFoundException(this.message);
}
