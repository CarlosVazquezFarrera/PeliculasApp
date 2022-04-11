import 'package:http/http.dart';
import 'package:peliculas/models/models.dart';
import 'package:peliculas/providers/provider_base.dart';

class MoviesProvider extends ProviderBase {
  MoviesProvider() : super('movie/') {
    obtenerPeliculas();
    obtenerPeliculasEnTendencia();
  }

  List<Movie> movies = [];
  List<Movie> moviesPopulares = [];

  ///Retorna toda la información sobre las peliculas en cartelera
  obtenerPeliculas() async {
    // Uri.parse
    final Response moviesResponse = await client.get(
        Uri.parse('${urlBase}now_playing'),
        params: {'language': 'es-ES', 'page': '1'});
    final NowPlayingResponse peliculasResponse =
        NowPlayingResponse.fromJson(moviesResponse.body);
    movies = peliculasResponse.results;
    notifyListeners();
  }

  ///Retorna toda la información sobre las peliculas en populares del nomento
  obtenerPeliculasEnTendencia() async {
    // Uri.parse
    final Response popularesReponse = await client.get(
        Uri.parse('${urlBase}popular'),
        params: {'language': 'es-ES', 'page': '1'});
    final PopularResponse peliculasResponse =
        PopularResponse.fromJson(popularesReponse.body);
    moviesPopulares = [...moviesPopulares, ...peliculasResponse.results];
    print(moviesPopulares);
    notifyListeners();
  }
}
