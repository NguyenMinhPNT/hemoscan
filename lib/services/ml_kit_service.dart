import 'dart:io';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image/image.dart' as img;

class MLKitService {
  final FaceDetector _faceDetector = GoogleMlKit.vision.faceDetector(
    FaceDetectorOptions(enableLandmarks: true, enableContours: true),
  );

  Future<img.Image?> detectAndCropEye(File imageFile) async {
    // TODO: Implement face detection and eye cropping
    return null;
  }

  void dispose() {
    _faceDetector.close();
  }
}
