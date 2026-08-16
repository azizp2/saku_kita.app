import 'package:get/get.dart';
import 'package:saku_kita_app/app/routes/app_routes.dart';
import 'package:saku_kita_app/core/storage/secure_storage.dart';

class AuthSessionController extends GetxController {
  final SecureStorage secureStorage;

  AuthSessionController({required this.secureStorage});

  @override
  void onInit() {
    super.onInit();

    print('AUTH SESSION: onInit');
  }

  @override
  void onReady() {
    super.onReady();

    checkSession();
  }

  Future<void> checkSession() async {
    await secureStorage.clearTokens();
    final hasToken = await secureStorage.hasAccessToken();

    if (hasToken) {
      Get.offAllNamed(AppRoutes.home);
    } else {
      Get.offAllNamed(AppRoutes.login);
    }
  }
}
