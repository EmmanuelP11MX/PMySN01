import 'package:flutter/material.dart';

import 'package:practica1/models/models.dart';
import 'package:practica1/providers/providers.dart';
import 'package:provider/provider.dart';

class CastingCard extends StatelessWidget {
  final int moveId;
  const CastingCard({Key? key, required this.moveId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);
    return FutureBuilder(
      future: moviesProvider.getMovieCast(moveId),
      builder: (_, AsyncSnapshot<List<Cast>> snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox(
            width: double.infinity,
            height: 180,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        final cast = snapshot.data!;
        return Container(
          color: Colors.black.withOpacity(0),
          margin: const EdgeInsets.only(bottom: 10),
          width: double.infinity,
          height: 145,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (_, index) => _CastCard(actor: cast[index]),
          ),
        );
      },
    );
  }
}

class _CastCard extends StatelessWidget {
  final Cast actor;
  const _CastCard({Key? key, required this.actor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 100,
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: FadeInImage(
                placeholder: const AssetImage("assets/actor_default.jpg"),
                image: NetworkImage(actor.fullProfilePath),
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              )),
          const SizedBox(
            height: 5,
          ),
          Text(actor.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white))
        ],
      ),
    );
  }
}
