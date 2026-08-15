import 'package:get/get.dart';
import 'package:saku_kita_app/core/network/api_client.dart';
import 'package:saku_kita_app/core/storage/secure_storage.dart';
import 'package:saku_kita_app/features/auth/controllers/login_controller.dart';
import 'package:saku_kita_app/features/auth/data_sources/auth_remote_data_source.dart';
import 'package:saku_kita_app/features/auth/repositories/auth_repository.dart';

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRemoteDataSource>(
      () => AuthRemoteDataSource(apiClient: Get.find<ApiClient>()),
    );

    Get.lazyPut<AuthRepository>(
      () => AuthRepository(remoteDataSource: Get.find<AuthRemoteDataSource>()),
    );

    Get.lazyPut<LoginController>(
      () => LoginController(
        authRepository: Get.find<AuthRepository>(),
        secureStorage: Get.find<SecureStorage>(),
      ),
    );
  }
}
