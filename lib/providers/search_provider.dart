import 'dart:async';

import 'package:peliculas/helpers/debounder.dart';
import 'package:peliculas/models/models.dart';
import 'package:peliculas/models/search_response.dart';
import 'package:peliculas/providers/provider_base.dart';

class SearchProvider extends ProviderBase {
  SearchProvider() : super('search/');

  final StreamController<List<Movie>> _suggestionsStreamController =
      StreamController.broadcast();

  Stream<List<Movie>> get suggestionStream =>
      _suggestionsStreamController.stream;

  final debouncer =
      Debouncer<String>(duration: const Duration(milliseconds: 5));

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
    debouncer.onValue = (value) async {
      if (value.isEmpty) return;

      if (lastWordSearched == value) {
        _suggestionsStreamController.add(lastResults);
        return;
      }
      print('Fue a buscar');
      final result = await obtenerPeliculas(value);

      lastWordSearched = value;
      lastResults = result;

      _suggestionsStreamController.add(result);
    };

    final timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      debouncer.value = searchWord;
    });
    Future.delayed(const Duration(milliseconds: 501))
        .then((_) => timer.cancel());
  }
}
