import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:saku_kita_app/core/storage/secure_storage.dart';
import 'package:saku_kita_app/features/auth/controllers/auth_session_controller.dart';

class AuthSessionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthSessionController>(
      AuthSessionController(secureStorage: Get.find<SecureStorage>()),
    );
  }
}
