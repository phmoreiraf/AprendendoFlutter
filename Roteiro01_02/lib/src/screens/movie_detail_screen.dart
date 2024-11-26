import 'package:flutter/material.dart';
import '../models/movie_model.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;
  MovieDetailScreen({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Diretor: ${movie.director}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Text('Ano: ${movie.year}',
                style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            Text('Sinopse:', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text(movie.synopsis, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
