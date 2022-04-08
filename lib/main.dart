import 'package:flutter/material.dart';
import 'package:peliculas/providers/provider_service.dart';
import 'package:peliculas/routes/app_routes.dart';
import 'package:peliculas/routes/routes_screens.dart';
import 'package:peliculas/theme/app_theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderService.getProviders(context),
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: RoutersScreen.home,
      routes: AppRoutes.getRoutes(),
      theme: AppTheme.lightTheme,
    );
  }
}
