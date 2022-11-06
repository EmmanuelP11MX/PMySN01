import 'package:flutter/material.dart';

import 'package:card_swiper/card_swiper.dart';
import 'package:practica1/models/models.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> movies;
  const CardSwiper({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (movies.isEmpty) {
      return SizedBox(
        width: double.infinity,
        height: size.height * 0.5,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.25,
      child: Swiper(
        autoplay: true,
        duration: 800,
        itemCount: movies.length,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.4,
        itemBuilder: (BuildContext context, int index) {
          final movie = movies[index];
          movie.heroId = "swiper-${movie.id}";
          return GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, "/details", arguments: movie),
            child: Hero(
              tag: movie.heroId!,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  ClipRRect(
                    child: FadeInImage(
                      width: double.infinity,
                      placeholder: const AssetImage("assets/image_default.jpg"),
                      image: NetworkImage(movie.fullBackdropImg),
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height: 60,
                    child: Material(
                      color: Colors.black.withOpacity(.5),
                      child: ListTile(
                        onTap: () => Navigator.pushNamed(context, '/details',
                            arguments: movie),
                        title: Text(movie.title,
                            style: const TextStyle(color: Colors.white)),
                        trailing: const Icon(Icons.chevron_right,
                            color: Colors.white, size: 25),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
