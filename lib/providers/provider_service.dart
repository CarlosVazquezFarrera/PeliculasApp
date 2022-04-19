import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/providers/search_provider.dart';
import 'package:provider/provider.dart';

class ProviderService {
  ///Obtiene los providers disponibles
  static getProviders(BuildContext context) {
    return [
      ChangeNotifierProvider(create: (BuildContext context) => MoviesProvider()),
      ChangeNotifierProvider(create: (BuildContext context) => SearchProvider())
    ];
  }
}
