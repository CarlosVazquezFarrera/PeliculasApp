import 'package:flutter/material.dart';
import 'package:peliculas/models/movie.dart';
import 'package:peliculas/routes/routes_screens.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({Key? key, required this.movies, required this.titulo})
      : super(key: key);

  final List<Movie> movies;
  final String titulo;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.3,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 8),
            child: Text(titulo,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: movies.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) => _Movie(movie: movies[index])),
          )
        ],
      ),
    );
  }
}

class _Movie extends StatelessWidget {
  const _Movie({Key? key, required this.movie}) : super(key: key);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      margin: const EdgeInsets.all(10),
      child: Column(children: [
        GestureDetector(
          onTap: () => {
            Navigator.pushNamed(context, RoutersScreen.details,
                arguments: 'Hola')
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FadeInImage(
                width: 70,
                height: 110,
                fit: BoxFit.cover,
                placeholder: const AssetImage('assets/loading.gif'),
                image: NetworkImage(movie.obtenerPortada)),
          ),
        ),
        Text(
          movie.title,
          maxLines: 2,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        )
      ]),
    );
  }
}
