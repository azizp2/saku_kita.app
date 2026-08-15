import 'package:freezed_annotation/freezed_annotation.dart';

import 'token_response.dart';

part 'login_response.freezed.dart';
part 'login_response.g.dart';

@freezed
abstract class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    required String fullName,
    required String email,
    required String role,
    required TokenResponse accessToken,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
