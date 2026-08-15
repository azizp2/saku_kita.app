import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('┌────────────────────────────────────');
    debugPrint('│ REQUEST');
    debugPrint('│ ${options.method} ${options.uri}');
    debugPrint('│ Headers: ${options.headers}');
    debugPrint('│ Data: ${options.data}');
    debugPrint('└────────────────────────────────────');

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint('┌────────────────────────────────────');
    debugPrint('│ RESPONSE');
    debugPrint('│ ${response.statusCode} ${response.requestOptions.uri}');
    debugPrint('│ Data: ${response.data}');
    debugPrint('└────────────────────────────────────');

    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint('┌────────────────────────────────────');
    debugPrint('│ ERROR');
    debugPrint('│ ${err.requestOptions.method} ${err.requestOptions.uri}');
    debugPrint('│ Type: ${err.type}');
    debugPrint('│ Status: ${err.response?.statusCode}');
    debugPrint('│ Data: ${err.response?.data}');
    debugPrint('│ Message: ${err.message}');
    debugPrint('└────────────────────────────────────');

    handler.next(err);
  }
}
