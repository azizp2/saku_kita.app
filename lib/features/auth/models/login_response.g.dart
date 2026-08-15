// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    _LoginResponse(
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      role: json['role'] as String,
      accessToken: TokenResponse.fromJson(
        json['accessToken'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$LoginResponseToJson(_LoginResponse instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'email': instance.email,
      'role': instance.role,
      'accessToken': instance.accessToken,
    };
