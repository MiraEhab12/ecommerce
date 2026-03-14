import 'package:dio/dio.dart';
import 'package:ecommerce_udemy/locator.dart';
import 'package:ecommerce_udemy/utils/helpers/storage_helper.dart';
import 'package:logger/logger.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  )
async {
    final token = await sl<SecureStorage>().getToken();

    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';

      /// 👀 Developer log
      sl<Logger>().i('TOKEN USED 👉 $token');
    }

    return handler.next(options);
  }
}
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    return handler.next(err);
  }

