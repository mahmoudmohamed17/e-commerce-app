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

  Future<Map<String, dynamic>> get({required String endpoint}) async {
    var response = await _dio.get('${ApiStrings.apiBaseUrl}$endpoint');
    return response.data;
  }

  Future<Map<String, dynamic>> post({
    required Map<String, dynamic> data,
    required String endpoint,
  }) async {
    var response = await _dio.post(
      '${ApiStrings.apiBaseUrl}$endpoint',
      data: data,
    );
    return response.data;
  }

  // Similar to PUT; as used to update a resource
  Future<Map<String, dynamic>> patch({
    required Map<String, dynamic> data,
    required String endpoint,
  }) async {
    var response = await _dio.patch(
      '${ApiStrings.apiBaseUrl}$endpoint',
      data: data,
    );
    return response.data;
  }

  Future<Map<String, dynamic>> delete({required String endpoint}) async {
    var response = await _dio.delete('${ApiStrings.apiBaseUrl}$endpoint');
    return response.data;
  }
}
