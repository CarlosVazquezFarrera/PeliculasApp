import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';
import '../providers/providers.dart';

class ActorCards extends StatelessWidget {
  const ActorCards({Key? key, required this.movieId}) : super(key: key);

  final int movieId;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final MoviesProvider moviesProvider = Provider.of<MoviesProvider>(context);

    return FutureBuilder(
      future: moviesProvider.obtenerMovieCast(movieId),
      builder: (_, AsyncSnapshot<List<Cast>> snapshot) {
        if (!snapshot.hasData) {
          return SizedBox(
            height: height * 0.25,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        final cast = snapshot.data!;

        return SizedBox(
          height: height * 0.25,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: cast.length,
            itemBuilder: (_, int index) {
              return ActorCard(actor: cast[index]);
            },
          ),
        );
      },
    );
  }
}

class ActorCard extends StatelessWidget {
  const ActorCard({Key? key, required this.actor}) : super(key: key);

  final Cast actor;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: width * 0.25,
      child: Column(
        children: [
          Expanded(
            flex: 9,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FadeInImage(
                  fit: BoxFit.cover,
                  placeholder: const AssetImage('assets/loading.gif'),
                  image: NetworkImage(actor.fullProfilePath)),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              actor.name,
              overflow: TextOverflow.clip,
              textAlign: TextAlign.center,
              style: theme.bodyLarge,
            ),
          )
        ],
      ),
    );
  }
}
