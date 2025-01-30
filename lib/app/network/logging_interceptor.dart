import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class LoggingInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    debugPrint('\n----- API Request -----');
    debugPrint('URL: ${options.uri}');
    debugPrint('Method: ${options.method}');
    debugPrint('Headers: ${options.headers}');
    if (options.data != null) {
      debugPrint('Body: ${options.data}');
    }
    debugPrint('-----------------------');
    return handler.next(options);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    debugPrint('\n----- API Error -----');
    debugPrint('URL: ${err.requestOptions.uri}');
    debugPrint('Error: $err');
    debugPrint('Error Type: ${err.type}');
    debugPrint('Error Message: ${err.message}');
    debugPrint('Error Data: ${err.response?.data}');
    debugPrint('Error Code: ${err.response?.statusCode}');
    debugPrint('---------------------');
    return handler.next(err);
  }

  @override
  Future<void> onResponse(Response response, handler) async {
    debugPrint('\n----- API Response -----');
    debugPrint('URL: ${response.requestOptions.uri}');
    debugPrint('Status Code: ${response.statusCode}');
    debugPrint('Headers: ${response.headers}');
    debugPrint('Body: ${response.data}');
    debugPrint('------------------------');
    return handler.next(response);
  }
}
