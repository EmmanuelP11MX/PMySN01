import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:practica1/models/popular_model.dart';

class PopularMoviesAPI {
  final URL =
      'https://api.themoviedb.org/3/movie/popular?api_key=<<api_key>>&language=es-MX&page=1';

  Future<List<PopularModel>?> getAllPopular() async {
    final response = await http.get(Uri.parse(URL));
    if (response.statusCode == 200) {
      var popular = jsonDecode(response.body)['results'] as List;
      List<PopularModel> listPopular =
          popular.map((movie) => PopularModel.fromJSON(movie)).toList();
      return listPopular;
    } else {
      return null;
    }
  }
}
