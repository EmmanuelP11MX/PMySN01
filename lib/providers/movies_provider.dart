import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practica1/database/database_favorite_m.dart';
import 'package:practica1/helpers/debuncer.dart';
import 'package:practica1/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  final String _apiKey = "0a115d141218871b1fd850171b8581a9";
  final String _baseUrl = "api.themoviedb.org";
  final String _language = "en-US";
  //final String _language = "es-MX";
  List<Movie> onDiplayMovies = [];
  List<Movie> popularMovies = [];
  List<Movie> lFavoriteMovies = [];
  Map<int, List<Cast>> movieCasts = {};
  Map<int, List<VideoInfo>> movieKeysvideos = {};
  int _popularPague = 0;

  final debouncer = Debouncer(duration: const Duration(milliseconds: 500));

  final StreamController<List<Movie>> _suggestionStreamController =
      StreamController.broadcast();
  Stream<List<Movie>> get suggestionStream =>
      _suggestionStreamController.stream;

  MoviesProvider() {
    getOnDisplayMovies();
    getPopularMovies();
  }
  Future<String> _getJsonData(String endponint, [int page = 1]) async {
    final url = Uri.https(_baseUrl, endponint,
        {'api_key': _apiKey, 'language': _language, 'page': '$page'});
    final response = await http.get(url);
    return response.body;
  }

  getOnDisplayMovies() async {
    final jsonData = await _getJsonData("3/movie/now_playing");
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);
    onDiplayMovies = nowPlayingResponse.results;
    List<FavoriteMovie> lis = await DBProviderMovies.db.getMovie();
    for (var element in lis) {
      for (var mo in onDiplayMovies) {
        if (mo.id == element.movieId) {
          mo.isFavorite = true;
        }
      }
    }
    notifyListeners();
  }

  getPopularMovies() async {
    _popularPague++;
    final jsonData = await _getJsonData("3/movie/popular", _popularPague);
    final popularResponse = PopularResponse.fromJson(jsonData);
    popularMovies = [...popularMovies, ...popularResponse.results];
    List<FavoriteMovie> lis = await DBProviderMovies.db.getMovie();
    for (var element in lis) {
      for (var mo in popularMovies) {
        if (mo.id == element.movieId) {
          lFavoriteMovies.add(mo);
          mo.isFavorite = true;
        }
      }
    }
    notifyListeners();
  }

  Future newFavoriteMovie(int movieId) async {
    FavoriteMovie fMovie = FavoriteMovie(movieId: movieId);
    fMovie.id = await DBProviderMovies.db.insertar(fMovie, 'Movies');
    Movie movie = changeStatus(movieId, true);
    lFavoriteMovies = [...lFavoriteMovies, movie];
    notifyListeners();
  }

  Future removeFavoriteMovie(int movieId) async {
    FavoriteMovie fMovie = FavoriteMovie(movieId: movieId);
    fMovie.id = await DBProviderMovies.db.deleteMovie(movieId);
    Movie movie = changeStatus(movieId, false);
    lFavoriteMovies.remove(movie);
    notifyListeners();
  }

  Movie changeStatus(int id, bool status) {
    late Movie movier;
    for (var movie in popularMovies) {
      if (id == movie.id) {
        movie.isFavorite = status;
        movier = movie;
      }
    }
    for (var movie in onDiplayMovies) {
      if (id == movie.id) {
        movie.isFavorite = status;
      }
    }
    return movier;
  }

  Future<List<Cast>> getMovieCast(int movieId) async {
    if (movieCasts.containsKey(movieId)) {
      return movieCasts[movieId]!;
    }
    final jsonData = await _getJsonData("3/movie/$movieId/credits");
    final credistResponse = CredistResponse.fromJson(jsonData);
    movieCasts[movieId] = credistResponse.cast;
    return credistResponse.cast;
  }

  Future<List<Movie>> searchMovie(String query) async {
    final url = Uri.https(_baseUrl, "3/search/movie",
        {'api_key': _apiKey, 'language': _language, 'query': query});
    final response = await http.get(url);
    final searchResponse = SearchResponse.fromJson(response.body);
    return searchResponse.results;
  }

  Future<List<VideoInfo>> getMovieKeyVideo(int movieId) async {
    if (movieKeysvideos.containsKey(movieId)) {
      return movieKeysvideos[movieId]!;
    }
    final jsonData = await _getJsonData("3/movie/$movieId/videos");
    final videosResponde = VideoResponse.fomJson(jsonData);
    if (videosResponde.results.isEmpty) {
      videosResponde.results.add(VideoInfo(
          name: 'Fuera de aire', key: '-TirlAZYd4e8', site: "YouTube"));
    }
    print(videosResponde.results);
    movieKeysvideos[movieId] = videosResponde.results;
    return videosResponde.results;
  }

  void getSuggestionsByQuery(String searchTerm) {
    debouncer.value = "";
    debouncer.onValue = (value) async {
      final results = await searchMovie(value);
      _suggestionStreamController.add(results);
    };
    final timer = Timer.periodic(const Duration(milliseconds: 300), (_) {
      debouncer.value = searchTerm;
    });
    Future.delayed(const Duration(milliseconds: 301))
        .then((_) => timer.cancel());
  }
}
