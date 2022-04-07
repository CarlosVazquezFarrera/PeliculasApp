import 'package:http_interceptor/http_interceptor.dart';

class ProviderInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    data.params['api_key'] = 'af453af0394ff4ffc9defb5eb3a4beed';
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    return data;
  }
}
