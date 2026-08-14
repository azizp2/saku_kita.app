import 'package:saku_kita_app/core/models/base_response.dart';
import 'package:saku_kita_app/core/network/api_client.dart';
import 'package:saku_kita_app/core/network/api_endpoints.dart';
import 'package:saku_kita_app/features/auth/models/login_response.dart';

class AuthRepository {
  final ApiClient apiClient;

  AuthRepository({required this.apiClient});

  Future<BaseResponse<LoginResponse>> login({
    required String email,
    required String password,
  }) {
    return apiClient.post<LoginResponse>(
      endpoint: ApiEndpoints.login,
      requiresAuth: false,
      body: {'userName': email, 'password': password},
      fromJson: (data) {
        return LoginResponse.fromJson(data);
      },
    );
  }
}
