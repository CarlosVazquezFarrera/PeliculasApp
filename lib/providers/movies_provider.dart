import 'package:peliculas/providers/provider_base.dart';

class MoviesProvider extends ProviderBase {
  MoviesProvider() : super('3/movie/now_playing') {
    obtenerPeliculas();
  }
  ///Retorna toda la información sobre las peliculas en cartelera
  obtenerPeliculas() async {
    final respuesta =
        await client.get(urlBase, params: {'language': 'es-ES', 'page': '1'});
  }
}
