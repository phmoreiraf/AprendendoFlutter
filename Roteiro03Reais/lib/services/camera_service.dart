import 'dart:io';

import 'package:camera/camera.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class CameraService {
  CameraController? controller;
  List<CameraDescription> cameras = [];

  Future<void> initialize() async {
    cameras = await availableCameras();
    if (cameras.isEmpty) throw Exception('Nenhuma câmera encontrada');

    controller = CameraController(cameras[0], ResolutionPreset.high);
    await controller!.initialize();
  }

  Future<String> takePicture() async {
    if (controller == null || !controller!.value.isInitialized) {
      throw Exception('Câmera não inicializada');
    }

    final Directory appDir = await getApplicationDocumentsDirectory();
    final String photoDir = path.join(appDir.path, 'Photos');
    await Directory(photoDir).create(recursive: true);

    final String filePath = path.join(photoDir, '${DateTime.now().millisecondsSinceEpoch}.jpg');
    XFile photo = await controller!.takePicture();
    photo.saveTo(filePath);

    return filePath;
  }

  void dispose() {
    controller?.dispose();
  }
}
