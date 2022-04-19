import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';
import 'package:peliculas/providers/providers.dart';
import 'package:provider/provider.dart';

import '../routes/routes_screens.dart';

class MovieSearchDelegate extends SearchDelegate {
  @override
  String? get searchFieldLabel => 'Buscar';
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () => query = '', icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => close(context, null),
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return const _EmptyContainer();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return const _EmptyContainer();
    }
    final SearchProvider moviesProvider =
        Provider.of<SearchProvider>(context, listen: false);

    return FutureBuilder(
      future: moviesProvider.obtenerPeliculas(query),
      builder: (_, AsyncSnapshot<List<Movie>> snapshot) {
        if (!snapshot.hasData) return const _EmptyContainer();
        final movies = snapshot.data!;
        return ListView.separated(
          itemCount: movies.length,
          itemBuilder: (_, int index) => _MovieItem(movie: movies[index]),
          separatorBuilder: (_, __) => const Divider(),
        );
      },
    );
  }
}

class _MovieItem extends StatelessWidget {
  const _MovieItem({Key? key, required this.movie}) : super(key: key);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return ListTile(
      leading: FadeInImage(
        placeholder: const AssetImage('assets/loading.gif'),
        image: NetworkImage(movie.fullposterPath),
        height: height * 0.125,
        fit: BoxFit.contain,
      ),
      title: Text(movie.title),
      onTap: () {
        Navigator.pushNamed(context, RoutersScreen.details, arguments: movie);
      },
    );
  }
}

class _EmptyContainer extends StatelessWidget {
  const _EmptyContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final witdh = MediaQuery.of(context).size.width;

    return SizedBox(
      child: Center(
        child: Icon(
          Icons.movie_creation_outlined,
          size: witdh * 0.65,
        ),
      ),
    );
  }
}
