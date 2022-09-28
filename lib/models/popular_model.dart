import 'package:flutter/foundation.dart';

class PopularModel {
  String? backdropPath;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? title;
  int? voteAverage;
  int? voteCount;

  PopularModel({
    this.backdropPath,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.title,
    this.voteAverage,
    this.voteCount,
  });

  factory PopularModel.fromJSON(Map<String, dynamic> mapa) {
    return PopularModel(
        backdropPath: mapa['backdrop_path'],
        id: mapa['id'],
        originalLanguage: mapa['original_language'],
        originalTitle: mapa['original_title'],
        overview: mapa['overview'],
        popularity: mapa['popularity'],
        posterPath: mapa['poster_path'],
        title: mapa['title'],
        voteAverage: mapa['vote_average'],
        voteCount: mapa['vote_count']);
  }
}
