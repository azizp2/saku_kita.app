import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/base_response.dart';
import '../storage/secure_storage.dart';

class ApiClient {
  final String baseUrl;
  final SecureStorage secureStorage;

  ApiClient({required this.baseUrl, required this.secureStorage});

  Future<BaseResponse<T>> post<T>({
    required String endpoint,
    Map<String, dynamic>? body,
    required T Function(dynamic data) fromJson,
    bool requiresAuth = true,
  }) async {
    final response = await _post(
      endpoint: endpoint,
      body: body,
      requiresAuth: requiresAuth,
    );

    return _parseResponse(response: response, fromJson: fromJson);
  }

  Future<BaseResponse<T>> get<T>({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic data) fromJson,
    bool requiresAuth = true,
  }) async {
    final uri = Uri.parse('$baseUrl$endpoint').replace(
      queryParameters: queryParameters?.map(
        (key, value) => MapEntry(key, value.toString()),
      ),
    );

    final headers = await _buildHeaders(requiresAuth: requiresAuth);

    final response = await http.get(uri, headers: headers);

    return _parseResponse(response: response, fromJson: fromJson);
  }

  Future<http.Response> _post({
    required String endpoint,
    Map<String, dynamic>? body,
    required bool requiresAuth,
  }) async {
    final headers = await _buildHeaders(requiresAuth: requiresAuth);

    return http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: headers,
      body: body != null ? jsonEncode(body) : null,
    );
  }

  Future<Map<String, String>> _buildHeaders({
    required bool requiresAuth,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    if (requiresAuth) {
      final accessToken = await secureStorage.getAccessToken();

      if (accessToken != null && accessToken.isNotEmpty) {
        headers['Authorization'] = 'Bearer $accessToken';
      }
    }

    return headers;
  }

  BaseResponse<T> _parseResponse<T>({
    required http.Response response,
    required T Function(dynamic data) fromJson,
  }) {
    final json = jsonDecode(response.body);

    return BaseResponse<T>.fromJson(json, fromJson);
  }
}
