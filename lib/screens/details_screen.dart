import 'package:flutter/material.dart';
import 'package:peliculas/theme/app_theme.dart';
import 'package:peliculas/widgets/widgets.dart';

import '../models/models.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
    return Scaffold(
      body: Center(
          child: CustomScrollView(
        slivers: [
          _CustomAdppBar(
            movie: movie,
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            _InfoAndPoster(movie: movie),
            _OverView(movie: movie),
            ActorCards(movieId: movie.id)
          ]))
        ],
      )),
    );
  }
}

class _InfoAndPoster extends StatelessWidget {
  const _InfoAndPoster({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Hero(
                tag: movie.movieId,
                child: FadeInImage(
                    width: width * 0.33,
                    placeholder: const AssetImage('assets/loading.gif'),
                    image: NetworkImage(movie.fullposterPath)),
              ),
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: width * 0.60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: theme.headline5,
                  maxLines: 3,
                ),
                Text(
                  movie.originalTitle,
                  style: theme.subtitle1,
                  maxLines: 3,
                ),
                Row(
                  children: [
                    const Icon(Icons.star_border_outlined),
                    const SizedBox(width: 5),
                    Text(movie.voteAverage.toString(), style: theme.bodyLarge)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _CustomAdppBar extends StatelessWidget {
  const _CustomAdppBar({Key? key, required this.movie}) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return SliverAppBar(
      backgroundColor: AppTheme.colorPrimary,
      expandedHeight: height * 0.23,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.all(0),
        centerTitle: true,
        title: Container(
            color: Colors.black.withOpacity(0.5),
            padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
            width: double.infinity,
            alignment: Alignment.bottomCenter,
            child: Text(
              movie.title,
              textAlign: TextAlign.center,
            )),
        background: FadeInImage(
            placeholder: const AssetImage('assets/loading.gif'),
            image: NetworkImage(movie.fullBackdropPath),
            fit: BoxFit.cover),
      ),
    );
  }
}

class _OverView extends StatelessWidget {
  const _OverView({Key? key, required this.movie}) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Text(
        movie.overview,
        textAlign: TextAlign.justify,
      ),
    );
  }
}
