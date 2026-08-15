import 'package:saku_kita_app/core/network/api_client.dart';
import 'package:saku_kita_app/core/network/api_endpoints.dart';
import 'package:saku_kita_app/features/auth/models/login_response.dart';

class AuthRemoteDataSource {
  final ApiClient apiClient;

  AuthRemoteDataSource({required this.apiClient});

  Future<LoginResponse> login({
    required String email,
    required String password,
  }) async {
    final response = await apiClient.postAndParse(
      ApiEndpoints.login,
      data: {'userName': email, 'password': password},
      fromJson: (data) => LoginResponse.fromJson(data as Map<String, dynamic>),
      requiresAuth: false,
    );

    return response;
  }
}
