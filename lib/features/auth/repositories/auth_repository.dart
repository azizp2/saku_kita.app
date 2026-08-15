import 'package:saku_kita_app/features/auth/data_sources/auth_remote_data_source.dart';
import 'package:saku_kita_app/features/auth/models/login_response.dart';

class AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepository({required this.remoteDataSource});

  Future<LoginResponse> login({
    required String email,
    required String password,
  }) {
    return remoteDataSource.login(email: email, password: password);
  }
}
