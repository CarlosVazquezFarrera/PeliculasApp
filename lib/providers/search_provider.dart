import 'package:peliculas/models/models.dart';
import 'package:peliculas/models/search_response.dart';
import 'package:peliculas/providers/provider_base.dart';

class SearchProvider extends ProviderBase {
  SearchProvider() : super('search/');

  /// Retorna las peliculas que en el título contentan lo que se ha introducido en el query

  Future<List<Movie>> obtenerPeliculas(String query) async {
    final movies = await client.get(Uri.parse('${urlBase}movie'), params: {
      ...baseParams,
      ...{'query': query}
    });
    final SearchResponse moviesResponse = SearchResponse.fromJson(movies.body);
    return moviesResponse.results;
  }
}
