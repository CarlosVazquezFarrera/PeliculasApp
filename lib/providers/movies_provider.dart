import 'package:http/http.dart';
import 'package:peliculas/models/models.dart';
import 'package:peliculas/providers/provider_base.dart';

class MoviesProvider extends ProviderBase {
  MoviesProvider() : super('3/movie/now_playing') {
    obtenerPeliculas();
  }

  List<Movie> movies = [];

  ///Retorna toda la información sobre las peliculas en cartelera
  obtenerPeliculas() async {
    final Response respuesta =
        await client.get(urlBase, params: {'language': 'es-ES', 'page': '1'});
    final NowPlayingResponse peliculasResponse =
        NowPlayingResponse.fromJson(respuesta.body);
    movies = peliculasResponse.results;
    notifyListeners();
  }
}
