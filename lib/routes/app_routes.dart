import 'package:flutter/material.dart';
import 'package:peliculas/models/menu_options.dart';
import 'package:peliculas/routes/routes_screens.dart';
import 'package:peliculas/screens/screens.dart';

class AppRoutes {
  static final _menuOptions = <MenuOptions>[
    MenuOptions(route: RoutersScreen.home, screen: const HomeScreen()),
    MenuOptions(route: RoutersScreen.details, screen: const DetailsScreen())
  ];

  /// Create our routes and bindinthem to screens
  static Map<String, Widget Function(BuildContext)> getRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    for (final route in _menuOptions) {
      appRoutes.addAll({route.route: (BuildContext context) => route.screen});
    }
    return appRoutes;
  }
}
