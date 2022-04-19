import 'package:flutter/material.dart';
import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:peliculas/providers/provider_interceptor.dart';

class ProviderBase extends ChangeNotifier {
  ProviderBase(String path) {
    urlBase = 'https://api.themoviedb.org/3/$path';
  }
  final Map<String, dynamic> baseParams = {'language': 'es-ES'};

  String urlBase = '';
  InterceptedClient client =
      InterceptedClient.build(interceptors: [ProviderInterceptor()]);
}
