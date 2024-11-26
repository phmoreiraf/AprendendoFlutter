import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Simulação de favoritos armazenados
    final List<String> favorites = ['Photo_123456', 'Photo_789012'];

    return Scaffold(
      appBar: AppBar(title: Text('Favoritos')),
      body: ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(favorites[index]));
        },
      ),
    );
  }
}
