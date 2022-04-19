import 'dart:convert';

import 'dart:math';

class Movie {
  Movie({
    required this.adult,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    this.posterPath,
    this.backdropPath,
    this.releaseDate,
  }) {
    movieId = _generateMovieId();
  }

  bool adult;
  List<int> genreIds;
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String title;
  bool video;
  double voteAverage;
  int voteCount;
  String? backdropPath;
  String? posterPath;
  String? releaseDate;
  String movieId = '';

  factory Movie.fromJson(String str) => Movie.fromMap(json.decode(str));

  factory Movie.fromMap(Map<String, dynamic> json) => Movie(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        releaseDate: json["release_date"],
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toMap() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "id": id,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date": releaseDate,
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
  String get fullposterPath {
    return posterPath != null
        ? 'https://image.tmdb.org/t/p/w500/$posterPath'
        : 'https://www.servicioaltoque.online/uploads/services/foo.jpg';
  }

  String get fullBackdropPath {
    return backdropPath != null
        ? 'https://image.tmdb.org/t/p/w500/$backdropPath'
        : 'https://www.servicioaltoque.online/uploads/services/foo.jpg';
  }

  String _generateMovieId() {
    Random random = Random();
    DateTime now = DateTime.now();
    return '$id-${random.nextInt(10)}-${now.microsecond}-${now.microsecond}';
  }
}
