import 'package:flutter/material.dart';
import '../models/movie_model.dart';
import 'movie_detail_screen.dart';

class MovieListScreen extends StatelessWidget {
  final List<Movie> movies = [
    Movie(
      title: 'O Poderoso Chefão',
      director: 'Francis Ford Coppola',
      synopsis: 'Uma saga sobre a máfia italiana...',
      year: '1972',
    ),
    Movie(
      title: 'Forrest Gump',
      director: 'Robert Zemeckis',
      synopsis: 'A história de um homem que vive várias aventuras...',
      year: '1994',
    ),
    Movie(
      title: 'Interestelar',
      director: 'Christopher Nolan',
      synopsis: 'Uma jornada épica pelo espaço e tempo...',
      year: '2014',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Filmes')),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return ListTile(
            title: Text(movie.title),
            subtitle: Text('${movie.director} (${movie.year})'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieDetailScreen(movie: movie),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
