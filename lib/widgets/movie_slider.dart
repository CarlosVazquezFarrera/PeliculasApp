import 'package:flutter/material.dart';
import 'package:peliculas/models/movie.dart';
import 'package:peliculas/routes/routes_screens.dart';

class MovieSlider extends StatefulWidget {
  const MovieSlider(
      {Key? key,
      required this.movies,
      required this.titulo,
      required this.onNextPage})
      : super(key: key);

  final List<Movie> movies;
  final String titulo;
  final Function onNextPage;

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(() {
      final double maxWidthSize = scrollController.position.pixels;
      final double nextTriggerPosition =
          scrollController.position.maxScrollExtent - 500;
      if (nextTriggerPosition >= maxWidthSize) {
        widget.onNextPage();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
            child: Text(widget.titulo,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: ListView.builder(
                controller: scrollController,
                itemCount: widget.movies.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) => _Movie(movie: widget.movies[index])),
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
                arguments: movie)
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FadeInImage(
                width: 70,
                height: 110,
                fit: BoxFit.cover,
                placeholder: const AssetImage('assets/loading.gif'),
                image: NetworkImage(movie.fullposterPath)),
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
