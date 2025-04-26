import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/utils/api_strings.dart';
import 'package:e_commerce_app/core/utils/dio_interceptor.dart';

class ApiService {
  final _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      sendTimeout: const Duration(seconds: 10),
    ),
  );

  ApiService() {
    _dio.interceptors.add(DioInterceptor());
  }

  Future<List<Map<String, dynamic>>> get({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    var response = await _dio.get(
      '${ApiStrings.apiBaseUrl}$endpoint',
      queryParameters: queryParameters,
    );
    return List<Map<String, dynamic>>.from(response.data);
  }

  Future<Map<String, dynamic>> post({
    required Map<String, dynamic> data,
    required String endpoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    var response = await _dio.post(
      '${ApiStrings.apiBaseUrl}$endpoint',
      data: data,
      queryParameters: queryParameters,
    );
    return Map<String, dynamic>.from(response.data);
  }

  // Similar to PUT; as used to update a resource
  Future<Map<String, dynamic>> patch({
    required Map<String, dynamic> data,
    required String endpoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    var response = await _dio.patch(
      '${ApiStrings.apiBaseUrl}$endpoint',
      data: data,
      queryParameters: queryParameters,
    );
    return Map<String, dynamic>.from(response.data);
  }

  Future<Map<String, dynamic>> delete({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    var response = await _dio.delete(
      '${ApiStrings.apiBaseUrl}$endpoint',
      queryParameters: queryParameters,
    );
    return Map<String, dynamic>.from(response.data);
  }
}
