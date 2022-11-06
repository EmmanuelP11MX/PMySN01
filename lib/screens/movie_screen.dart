import 'package:flutter/material.dart';

import 'package:practica1/providers/providers.dart';
import 'package:practica1/widgets/widgets.dart';
import 'package:provider/provider.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          MovieSlider(
              movies: moviesProvider.popularMovies,
              onNextPage: () => moviesProvider.getPopularMovies()),
        ],
      ),
    );
  }
}
