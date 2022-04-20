import 'dart:async';

import 'package:peliculas/models/models.dart';
import 'package:peliculas/models/search_response.dart';
import 'package:peliculas/providers/provider_base.dart';
import 'package:easy_debounce/easy_debounce.dart';

class SearchProvider extends ProviderBase {
  SearchProvider() : super('search/');

  final StreamController<List<Movie>> _suggestionsStreamController =
      StreamController.broadcast();

  Stream<List<Movie>> get suggestionStream =>
      _suggestionsStreamController.stream;

  List<Movie> lastResults = [];
  String lastWordSearched = '';

  /// Retorna las peliculas que en el título contentan lo que se ha introducido en el query

  Future<List<Movie>> obtenerPeliculas(String query) async {
    final movies = await client.get(Uri.parse('${urlBase}movie'), params: {
      ...baseParams,
      ...{'query': query}
    });
    final SearchResponse moviesResponse = SearchResponse.fromJson(movies.body);
    return moviesResponse.results;
  }

  void getSuggestionByQuery(String searchWord) {
    if (searchWord.isEmpty) return;
    if (lastWordSearched == searchWord) {
      _suggestionsStreamController.add(lastResults);
      return;
    }
    EasyDebounce.debounce('buscarPelis', const Duration(milliseconds: 500),
        () async {
      final result = await obtenerPeliculas(searchWord);
      lastWordSearched = searchWord;
      lastResults = result;
      _suggestionsStreamController.add(result);
    });
  }
}
