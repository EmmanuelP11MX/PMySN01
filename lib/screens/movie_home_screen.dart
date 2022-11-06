import 'package:flutter/material.dart';

import 'package:practica1/screens/favorite_movie_screen.dart';
import 'movie_screen.dart';

class MovieHomeScreen extends StatelessWidget {
  const MovieHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Populares"),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FavoriteMovieScreen()),
                );
              },
              icon: const Icon(Icons.favorite)),
        ],
      ),
      body: const MovieScreen(),
    );
  }
}
