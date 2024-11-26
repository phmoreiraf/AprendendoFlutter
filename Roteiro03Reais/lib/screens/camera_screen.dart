import 'package:flutter/material.dart';
import 'dart:io';
import '../services/camera_service.dart';
import '../models/photo.dart';
import '../utils/logger.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  final CameraService _cameraService = CameraService();
  List<Photo> _photos = [];

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      await _cameraService.initialize();
      setState(() {});
    } catch (e) {
      logError(context, e.toString());
    }
  }

  Future<void> _takePicture() async {
    try {
      final path = await _cameraService.takePicture();
      setState(() {
        _photos.add(Photo(path, DateTime.now()));
      });
    } catch (e) {
      logError(context, e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Câmera')),
      body: Column(
        children: [
          Expanded(
            child: _photos.isEmpty
                ? Center(child: Text('Nenhuma foto tirada'))
                : GridView.builder(
                    itemCount: _photos.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                    itemBuilder: (context, index) => Image.file(File(_photos[index].path)),
                  ),
          ),
          FloatingActionButton(onPressed: _takePicture, child: Icon(Icons.camera)),
        ],
      ),
    );
  }
}
