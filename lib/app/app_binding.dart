import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:saku_kita_app/app/config/app_config.dart';
import 'package:saku_kita_app/core/network/api_client.dart';
import 'package:saku_kita_app/core/storage/secure_storage.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SecureStorage>(SecureStorage(), permanent: true);

    Get.put<ApiClient>(
      ApiClient(
        baseUrl: AppConfig.apiBaseUrl,
        secureStorage: Get.find<SecureStorage>(),
      ),
      permanent: true,
    );
  }
}
