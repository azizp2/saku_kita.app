import 'package:saku_kita_app/features/auth/models/token_response.dart';

class LoginResponse {
  final String fullName;
  final String email;
  final String role;
  final TokenResponse accessToken;

  LoginResponse({
    required this.fullName,
    required this.email,
    required this.role,
    required this.accessToken,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      fullName: json['fullName'] ?? '',
      email: json['email'] ?? '',
      role: json['role'] ?? '',
      accessToken: TokenResponse.fromJson(json['accessToken']),
    );
  }
}
