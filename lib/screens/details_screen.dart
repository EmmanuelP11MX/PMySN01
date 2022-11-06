import 'package:flutter/material.dart';

import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:practica1/models/models.dart';
import 'package:practica1/widgets/widgets.dart';
import 'package:provider/provider.dart';
import '../providers/movies_provider.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
    return Scaffold(
      appBar: AppBar(title: const Text('Movie Details')),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(movie.fullPosterImg),
              fit: BoxFit.cover,
              // ignore: unnecessary_new
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.8), BlendMode.darken)),
        ),
        child: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildListDelegate([
              Stack(
                children: [
                  Column(
                    children: [
                      _PosterAndTitle(
                        image: movie.fullPosterImg,
                        title: movie.title,
                        votes: movie.voteCount,
                        votes2: movie.voteAverage,
                        popularity: movie.popularity,
                        originalTitle: movie.originalTitle,
                        movieHeroId: movie.heroId!,
                        id: movie.id,
                        isFavorite: movie.isFavorite,
                      ),
                      const ListTile(
                        leading: Icon(Icons.account_box_rounded,
                            color: Colors.white),
                        title: Text('Casting',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                      ),
                      CastingCard(moveId: movie.id),
                      const Divider(),
                      const ListTile(
                        leading: Icon(Icons.movie, color: Colors.white),
                        title: Text('Sinopsis',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                      ),
                      _Overview(
                        overview: movie.overview,
                      ),
                      const Divider(),
                      const ListTile(
                        leading:
                            Icon(Icons.video_collection, color: Colors.white),
                        title: Text('Video',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                      ),
                      VideoCard(movieId: movie.id),
                    ],
                  ),
                ],
              ),
            ])),
          ],
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final String title;
  final String image;
  final String originalTitle;
  final int votes;
  final double votes2;
  final double popularity;
  final String movieHeroId;
  final int id;
  final bool isFavorite;
  const _PosterAndTitle(
      {Key? key,
      required this.title,
      required this.image,
      required this.votes,
      required this.votes2,
      required this.popularity,
      required this.originalTitle,
      required this.movieHeroId,
      required this.id,
      required this.isFavorite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    final TextTheme textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return Material(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(30),
        topLeft: Radius.circular(30),
      ),
      color: Colors.black.withOpacity(0),
      child: Row(
        children: [
          Row(children: [
            Hero(
              tag: movieHeroId,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: FadeInImage(
                  placeholder: const AssetImage("assets/default_image.jpg"),
                  image: NetworkImage(image),
                  height: 325,
                ),
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: size.width - 220),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Divider(),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                    overflow: TextOverflow.fade,
                    maxLines: 5,
                  ),
                  const Divider(),
                  Text(
                    originalTitle,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5,
                  ),
                  const Divider(),
                  RatingStars(
                    value: votes2 / 2,
                    starBuilder: (index, color) => Icon(
                      Icons.star,
                      color: color,
                    ),
                    starCount: 5,
                    starSize: 20,
                    valueLabelColor: const Color(0xff9b9b9b),
                    valueLabelTextStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 12.0),
                    valueLabelRadius: 10,
                    maxValue: 5,
                    starSpacing: 2,
                    maxValueVisibility: true,
                    valueLabelVisibility: true,
                    animationDuration: const Duration(milliseconds: 8),
                    valueLabelPadding:
                        const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                    valueLabelMargin: const EdgeInsets.only(right: 8),
                    starOffColor: const Color(0xffe7e8ea),
                    starColor: Colors.yellow,
                  ),
                  const Divider(),
                  Column(
                    children: [
                      IconButton(
                          onPressed: () async {
                            if (isFavorite == false) {
                              await moviesProvider
                                  .newFavoriteMovie(id)
                                  .then((value) {
                                final snackBar = SnackBar(
                                    content:
                                        Text('$title agregada a favoritos'));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                                Navigator.pop(context);
                              });
                            } else {
                              await moviesProvider
                                  .removeFavoriteMovie(id)
                                  .then((value) {
                                final snackBar = SnackBar(
                                    content:
                                        Text('$title se elimino favoritas'));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                                Navigator.pop(context);
                              });
                            }
                          },
                          icon: isFavorite == true
                              ? const Icon(
                                  Icons.favorite_rounded,
                                  size: 30,
                                  color: Colors.red,
                                )
                              : const Icon(
                                  Icons.favorite_border_outlined,
                                  size: 30,
                                  color: Colors.white,
                                )),
                      const Text(
                        "Me Gusta",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ])
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  final String overview;

  const _Overview({Key? key, required this.overview}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withOpacity(0),
      child: Text(overview,
          textAlign: TextAlign.left,
          style: const TextStyle(color: Colors.white, fontSize: 15)),
    );
  }
}
