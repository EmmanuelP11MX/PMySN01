/*import 'package:flutter/material.dart';
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
          if (snapshot.connectionState == ConnectionState.done)
            return _listViewPopular(snapshot.data);
          else if (snapshot.hasError)
            return Center(
              child: Text(
                  'Ocurrio un error en la petición ${snapshot.error.toString()}'),
            );
          else
            return Center(
              child: CircularProgressIndicator(),
            );
        },
      ),
    );
  }
}

Widget _listViewPopular(List<PopularModel>? snapshot) {
  return ListView.separated(
    separatorBuilder: (context, index) => Divider(color: Colors.black),
    padding: EdgeInsets.all(10),
    itemCount: snapshot!.length,
    itemBuilder: (context, index) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            FadeInImage(
              fadeInDuration: Duration(milliseconds: 500),
              placeholder: AssetImage('assets/loading.gif'),
              image: NetworkImage(
                  'https://image.tmdb.org/t/p/w500/${snapshot[index].backdropPath!}'),
            ),
            Container(
              color: Colors.black.withOpacity(.6),
              height: 60,
              child: ListTile(
                onTap: () => Navigator.pushNamed(context, '/detail',
                    arguments: snapshot[index]),
                title: Text(
                  '${snapshot[index].title}',
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            )
          ],
        ),
      );
    },
  );
}*/
