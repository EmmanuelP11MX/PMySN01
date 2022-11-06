import 'package:flutter/material.dart';
import 'package:practica1/models/models.dart';
import 'package:practica1/providers/providers.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoCard extends StatelessWidget {
  final int movieId;
  const VideoCard({Key? key, required this.movieId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);
    return FutureBuilder(
      future: moviesProvider.getMovieKeyVideo(movieId),
      builder: (_, AsyncSnapshot<List<VideoInfo>> snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox(
            width: double.infinity,
            height: 300,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        final cast = snapshot.data!;
        return Container(
          margin: const EdgeInsets.only(bottom: 30),
          width: double.infinity,
          height: 280,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 1,
            itemBuilder: (_, index) => _CastCard(video: cast[index]),
          ),
        );
      },
    );
  }
}

class _CastCard extends StatelessWidget {
  final VideoInfo video;
  const _CastCard({Key? key, required this.video}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: YoutubePlayerController(
        initialVideoId: video.key,
        flags: const YoutubePlayerFlags(
          hideControls: true,
          controlsVisibleAtStart: true,
          autoPlay: true,
          loop: true,
          mute: false,
        ),
      ),
      showVideoProgressIndicator: true,
      progressIndicatorColor: Colors.red,
    );
  }
}
