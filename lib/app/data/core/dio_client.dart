import 'dart:io';

import 'package:dio/dio.dart';
import 'package:tugas2/app/util/app_constants.dart';

abstract class DioClient {
  Future<dynamic> get(String url, {Map<String, dynamic>? queryParameters});

  Future<dynamic> post(String url, {required body});
}

class DioClientImpl implements DioClient {
  late Dio _dio;

  DioClientImpl() {
    _initApiClient();
  }

  void _initApiClient() {
    BaseOptions options = BaseOptions(
      baseUrl: AppConstants.baseUrl,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
      responseType: ResponseType.json,
    );
    _dio = Dio(options);
  }

  @override
  Future<dynamic> get(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get(
        url,
        queryParameters: queryParameters,
      );

      return response.data;
    } on DioError catch (e) {
      if (e.response?.data != null) throw Exception(e.response?.data);

      throw Exception(e.message);
    }
  }

  @override
  Future<dynamic> post(
    String url, {
    required body,
    bool authorization = false,
  }) async {
    try {
      final response = await _dio.post(url, data: body);

      return response.data;
    } on DioError catch (e) {
      if (e.response?.data != null) throw Exception(e.response?.data);

      throw Exception(e.message);
    }
  }
}
