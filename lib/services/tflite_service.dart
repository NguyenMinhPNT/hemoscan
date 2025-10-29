import 'dart:io';
import 'package:tflite_flutter/tflite_flutter.dart';
import '../models/anemia_result.dart';

class TFLiteService {
  Interpreter? _interpreter;

  Future<void> loadModel() async {
    // TODO: Load TFLite model from assets/ml/hemoscan_model.tflite
    // _interpreter = await Interpreter.fromAsset('assets/ml/hemoscan_model.tflite');
  }

  Future<AnemiaResult?> runInference(File imageFile) async {
    // TODO: Implement inference
    return null;
  }

  void dispose() {
    _interpreter?.close();
  }
}
