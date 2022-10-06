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
          if (snapshot.hasData)
            return _listViewPopular(snapshot.data);
          else if (snapshot.hasError)
            return Center(
              child: Text('Ocurrio un error en la petición'),
            );
          else
            return Center(
              child: CircularProgressIndicator(),
            );
        },
      ),
    );
  }

  Widget _listViewPopular(List<PopularModel>? snapshot) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Text(snapshot![index].title!);
      },
    );
  }
}
