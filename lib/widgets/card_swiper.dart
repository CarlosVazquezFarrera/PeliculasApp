import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:peliculas/models/movie.dart';

import '../routes/routes_screens.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({Key? key, required this.movies}) : super(key: key);

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    if (movies.isEmpty) {
      return SizedBox(
        width: double.infinity,
        height: height * 0.6,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Container(
      margin: const EdgeInsets.only(top: 5),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: double.infinity,
        height: height * 0.6,
        child: Swiper(
          loop: false,
          itemCount: movies.length,
          viewportFraction: 0.8,
          scale: 0.9,
          itemBuilder: (_, index) {
            return GestureDetector(
              onTap: () => {
                Navigator.pushNamed(context, RoutersScreen.details,
                    arguments: movies[index])
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Hero(
                  tag: movies[index].movieId,
                  child: FadeInImage(
                    fit: BoxFit.cover,
                    placeholder: const AssetImage('assets/loading.gif'),
                    image: NetworkImage(movies[index].fullposterPath),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
