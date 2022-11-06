import 'package:flutter/material.dart';
import 'package:practica1/providers/providers.dart';
import 'package:practica1/widgets/widgets.dart';
import 'package:provider/provider.dart';

class FavoriteMovieScreen extends StatelessWidget {
  const FavoriteMovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Favoritas"),
      ),
      body: moviesProvider.lFavoriteMovies.isEmpty
          ? const Center(
              child: Text(
                'No hay peliculas favoritas 😢',
                style: TextStyle(fontSize: 50),
                textAlign: TextAlign.center,
              ),
            )
          : ListView(
              children: [
                MovieSlider(
                    movies: moviesProvider.lFavoriteMovies,
                    onNextPage: () => moviesProvider.lFavoriteMovies),
              ],
            ),
    );
  }
}
