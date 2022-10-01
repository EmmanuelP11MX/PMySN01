import 'package:flutter/material.dart';
import 'package:practica1/network/popular_movies_api.dart';
import '../models/popular_model.dart';

class ListPopularScreen extends StatefulWidget {
  ListPopularScreen({super.key});

  @override
  State<ListPopularScreen> createState() => _ListPopularScreenState();
}

class _ListPopularScreenState extends State<ListPopularScreen> {
  PopularMoviesAPI popularAPI = PopularMoviesAPI();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Movies'),
      ),
      body: FutureBuilder(
        future: popularAPI.getAllPopular(),
        builder: (BuildContext context,
            AsyncSnapshot<List<PopularModel>?> snapshot) {
          return _ListViewPopular(snapshot.data);
        },
      ),
    );
  }

  Widget _ListViewPopular(List<PopularModel>? snapshot) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Text(snapshot![index].title!);
      },
    );
  }
}
