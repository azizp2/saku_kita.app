import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:saku_kita_app/core/models/base_response.dart';
import 'package:saku_kita_app/core/network/interceptor/auth_interceptor.dart';
import 'package:saku_kita_app/core/network/interceptor/logging_interceptor.dart';
import 'package:saku_kita_app/core/storage/secure_storage.dart';

import '../exceptions/api_exception.dart';
import '../models/api_error.dart';

class ApiClient {
  final Dio _dio;

  ApiClient({required String baseUrl, required SecureStorage secureStorage})
    : _dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 10),
          sendTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      ) {
    _dio.interceptors.add(AuthInterceptor(secureStorage: secureStorage));
    if (kDebugMode) {
      _dio.interceptors.add(LoggingInterceptor());
    }
  }

  Dio get dio => _dio;

  Future<Response<T>> get<T>(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    bool requiresAuth = true,
  }) async {
    try {
      return await _dio.get<T>(
        endpoint,
        queryParameters: queryParameters,
        options: Options(extra: {'requiresAuth': requiresAuth}),
      );
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  Future<Response<T>> post<T>(
    String endpoint, {
    dynamic data,
    bool requiresAuth = true,
  }) async {
    try {
      return await _dio.post<T>(
        endpoint,
        data: data,
        options: Options(extra: {'requiresAuth': requiresAuth}),
      );
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  Future<Response<T>> put<T>(
    String endpoint, {
    dynamic data,
    bool requiresAuth = true,
  }) async {
    try {
      return await _dio.put<T>(
        endpoint,
        data: data,
        options: Options(extra: {'requiresAuth': requiresAuth}),
      );
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  Future<Response<T>> patch<T>(
    String endpoint, {
    dynamic data,
    bool requiresAuth = true,
  }) async {
    try {
      return await _dio.patch<T>(
        endpoint,
        data: data,
        options: Options(extra: {'requiresAuth': requiresAuth}),
      );
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  Future<Response<T>> delete<T>(
    String endpoint, {
    dynamic data,
    bool requiresAuth = true,
  }) async {
    try {
      return await _dio.delete<T>(
        endpoint,
        data: data,
        options: Options(extra: {'requiresAuth': requiresAuth}),
      );
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  Future<T> postAndParse<T>(
    String endpoint, {
    dynamic data,
    required T Function(dynamic json) fromJson,
    bool requiresAuth = true,
  }) async {
    final response = await post(
      endpoint,
      data: data,
      requiresAuth: requiresAuth,
    );

    final baseResponse = BaseResponse<T>.fromJson(
      response.data as Map<String, dynamic>,
      fromJson,
    );

    if (!baseResponse.success || baseResponse.data == null) {
      throw ApiException(errors: baseResponse.errors);
    }

    return baseResponse.data as T;
  }

  Future<BaseResponse<T>> getAndParse<T>(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic json) fromJson,
    bool requiresAuth = true,
  }) async {
    final response = await get(
      endpoint,
      queryParameters: queryParameters,
      requiresAuth: requiresAuth,
    );

    final baseResponse = BaseResponse<T>.fromJson(
      response.data as Map<String, dynamic>,
      fromJson,
    );

    if (!baseResponse.success) {
      throw ApiException(errors: baseResponse.errors);
    }

    return baseResponse; // ✅ pagination masih ikut di sini
  }

  ApiException _handleDioException(DioException e) {
    final responseData = e.response?.data;

    if (responseData is Map<String, dynamic>) {
      final rawErrors = responseData['errors'];

      if (rawErrors is List) {
        final errors = rawErrors
            .whereType<Map<String, dynamic>>()
            .map(ApiError.fromJson)
            .toList();

        if (errors.isNotEmpty) {
          return ApiException(errors: errors);
        }
      }
    }

    return ApiException(
      errors: [
        ApiError(
          statusCode: e.response?.statusCode ?? 0,
          errorCode: _getErrorCode(e),
          message: _getErrorMessage(e),
          field: null,
        ),
      ],
    );
  }

  String _getErrorCode(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return 'Network.ConnectionTimeout';

      case DioExceptionType.sendTimeout:
        return 'Network.SendTimeout';

      case DioExceptionType.receiveTimeout:
        return 'Network.ReceiveTimeout';

      case DioExceptionType.connectionError:
        return 'Network.ConnectionError';

      case DioExceptionType.cancel:
        return 'Network.Cancelled';

      case DioExceptionType.badResponse:
        return 'Api.Error';

      case DioExceptionType.badCertificate:
        return 'Network.BadCertificate';

      case DioExceptionType.unknown:
        return 'Network.Unknown';
      case DioExceptionType.transformTimeout:
        throw UnimplementedError();
    }
  }

  String _getErrorMessage(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return 'Koneksi ke server timeout.';

      case DioExceptionType.sendTimeout:
        return 'Pengiriman request timeout.';

      case DioExceptionType.receiveTimeout:
        return 'Server terlalu lama memberikan response.';

      case DioExceptionType.connectionError:
        return 'Tidak dapat terhubung ke server.';

      case DioExceptionType.cancel:
        return 'Request dibatalkan.';

      case DioExceptionType.badCertificate:
        return 'Sertifikat server tidak valid.';

      case DioExceptionType.badResponse:
        return 'Server mengembalikan error.';

      case DioExceptionType.unknown:
        return 'Terjadi kesalahan yang tidak diketahui.';
      case DioExceptionType.transformTimeout:
        throw UnimplementedError();
    }
  }
}
