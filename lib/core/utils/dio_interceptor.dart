import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/utils/api_strings.dart';

class DioInterceptor implements Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log('The error is: ${err.message}');
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers = ApiStrings.apiHeaders;
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('The response is: ${response.data}');
    handler.next(response);
  }
}
