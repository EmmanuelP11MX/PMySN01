import 'package:flutter/material.dart';

import 'package:practica1/models/models.dart';

class MovieSlider extends StatefulWidget {
  final List<Movie> movies;
  final String? title;
  final double? vouteAverage;
  final Function onNextPage;
  const MovieSlider(
      {Key? key,
      required this.movies,
      this.title,
      required this.onNextPage,
      this.vouteAverage})
      : super(key: key);

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  final ScrollController scrolCintroller = ScrollController();

  @override
  void initState() {
    super.initState();
    scrolCintroller.addListener(() {
      if (scrolCintroller.position.pixels >=
          scrolCintroller.position.maxScrollExtent - 500) {
        widget.onNextPage();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 900,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Center(
                child: Text(
                  widget.title!,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          Expanded(
            child: ListView.builder(
              controller: scrolCintroller,
              scrollDirection: Axis.vertical,
              itemCount: widget.movies.length,
              itemBuilder: (_, int index) {
                final movie = widget.movies[index];
                return _MoviePoster(
                  movie: movie,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  final Movie movie;
  const _MoviePoster({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    movie.heroId = "slider-${movie.id}";
    return Container(
      width: 460,
      height: 740,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, "/details", arguments: movie),
            child: Hero(
              tag: movie.heroId!,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: FadeInImage(
                      placeholder: const AssetImage('assets/image_default.jpg'),
                      image: NetworkImage(movie.fullPosterImg),
                      width: 460,
                      height: 740,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 60,
                    child: Material(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black.withOpacity(.5),
                      child: ListTile(
                        onTap: () => Navigator.pushNamed(context, '/details',
                            arguments: movie),
                        title: Text(movie.title,
                            style: const TextStyle(color: Colors.white)),
                        trailing: const Icon(Icons.chevron_right_rounded,
                            color: Colors.white, size: 30),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
