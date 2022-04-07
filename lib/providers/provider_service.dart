import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class ProviderService {
  static final List<ChangeNotifier> _providers = [MoviesProvider()];

  ///Obtiene los providers disponibles
  static List<ChangeNotifierProvider<ChangeNotifier>> getProviders(
      BuildContext context) {
    return _providers
        .map((p) => ChangeNotifierProvider(create: (BuildContext context) => p))
        .toList();
  }
}
