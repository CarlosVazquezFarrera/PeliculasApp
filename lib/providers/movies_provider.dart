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
  int _tendenciaPage = 0;
  final Map<int, List<Cast>> _movieCast = {};
  final Map<String, dynamic> _baseParams = {'language': 'es-ES'};

  ///Retorna toda la información sobre las peliculas en cartelera
  obtenerPeliculas() async {
    // Uri.parse
    final Response moviesResponse =
        await client.get(Uri.parse('${urlBase}now_playing'), params: {
      ..._baseParams,
      ...{'page': '1'}
    });
    final NowPlayingResponse peliculasResponse =
        NowPlayingResponse.fromJson(moviesResponse.body);
    movies = peliculasResponse.results;
    notifyListeners();
  }

  ///Retorna toda la información sobre las peliculas en populares del nomento
  obtenerPeliculasEnTendencia() async {
    _tendenciaPage++;
    // Uri.parse
    final Response popularesReponse =
        await client.get(Uri.parse('${urlBase}popular'), params: {
      ..._baseParams,
      ...{'page': _tendenciaPage}
    });
    final PopularResponse peliculasResponse =
        PopularResponse.fromJson(popularesReponse.body);
    moviesPopulares = [...moviesPopulares, ...peliculasResponse.results];
    notifyListeners();
  }

  ///Con base al id de la pelicula retorna el cast de la pelicula
  Future<List<Cast>> obtenerMovieCast(int movieId) async {
    if (_movieCast.containsKey(movieId)) return _movieCast[movieId]!;

    final movieCast = await client.get(Uri.parse('$urlBase$movieId/credits'));
    final CreditResponse creditResponse =
        CreditResponse.fromJson(movieCast.body);
    _movieCast[movieId] = creditResponse.cast;
    return creditResponse.cast;
  }
}
