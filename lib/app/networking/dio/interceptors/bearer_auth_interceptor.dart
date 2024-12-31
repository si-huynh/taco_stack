import 'package:nylo_framework/nylo_framework.dart';

import '/config/keys.dart';

class BearerAuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final userToken = Backpack.instance.read(Keys.auth);
    options.headers.addAll({'Authorization': 'Bearer $userToken'});
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }
}
