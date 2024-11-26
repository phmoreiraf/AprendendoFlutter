import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  List<String> _photos = [];
  List<String> _favorites = [];

  void _simulateTakePhoto() {
    setState(() {
      _photos.add('Photo_${DateTime.now().millisecondsSinceEpoch}');
    });
  }

  void _toggleFavorite(String photo) {
    setState(() {
      if (_favorites.contains(photo)) {
        _favorites.remove(photo);
      } else {
        _favorites.add(photo);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Câmera Simulada')),
      body: Column(
        children: [
          Expanded(
            child: _photos.isEmpty
                ? Center(child: Text('Nenhuma foto tirada'))
                : ListView.builder(
                    itemCount: _photos.length,
                    itemBuilder: (context, index) {
                      String photo = _photos[index];
                      return ListTile(
                        title: Text(photo),
                        trailing: IconButton(
                          icon: Icon(
                            _favorites.contains(photo) ? Icons.favorite : Icons.favorite_border,
                          ),
                          onPressed: () => _toggleFavorite(photo),
                        ),
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _simulateTakePhoto,
              child: Text('Tirar Foto'),
            ),
          ),
        ],
      ),
    );
  }
}
