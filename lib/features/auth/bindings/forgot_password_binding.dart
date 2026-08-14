import 'package:get/get.dart';
import 'package:saku_kita_app/core/network/api_client.dart';
import 'package:saku_kita_app/core/storage/secure_storage.dart';
import 'package:saku_kita_app/features/auth/controllers/login_controller.dart';
import 'package:saku_kita_app/features/auth/repositories/auth_repository.dart';

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
      () => AuthRepository(apiClient: Get.find<ApiClient>()),
    );

    Get.lazyPut<LoginController>(
      () => LoginController(
        authRepository: Get.find<AuthRepository>(),
        secureStorage: Get.find<SecureStorage>(),
      ),
    );
  }
}
