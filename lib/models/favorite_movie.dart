class FavoriteMovie {
  int? id;
  int? movieId;

  FavoriteMovie({this.id, this.movieId});
  factory FavoriteMovie.fromJSON(Map<String, dynamic> mapMovie) {
    return FavoriteMovie(
      id: mapMovie['id'],
      movieId: mapMovie['movie_id'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'movie_id': movieId,
      };
}
