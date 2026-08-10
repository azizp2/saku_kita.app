import 'package:get/get.dart';
import 'package:saku_kita_app/features/auth/controllers/login_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
