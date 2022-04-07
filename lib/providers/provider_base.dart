import 'package:flutter/material.dart';
import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:peliculas/providers/provider_interceptor.dart';

class ProviderBase extends ChangeNotifier {
  ProviderBase(String path) {
    urlBase = Uri(scheme: 'https', host: 'api.themoviedb.org', path: path);
  }
  Uri urlBase = Uri();
  InterceptedClient client =
      InterceptedClient.build(interceptors: [ProviderInterceptor()]);
}
