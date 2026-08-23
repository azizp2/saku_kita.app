import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:saku_kita_app/core/network/api_client.dart';
import 'package:saku_kita_app/features/category/controllers/category_controller.dart';
import 'package:saku_kita_app/features/category/data_sources/category_remote_data_source.dart';
import 'package:saku_kita_app/features/category/repo/category_repo.dart';

class CategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryRemoteDataSource>(
      () => CategoryRemoteDataSource(apiClient: Get.find<ApiClient>()),
    );

    Get.lazyPut<CategoryRepo>(
      () =>
          CategoryRepo(remoteDataSource: Get.find<CategoryRemoteDataSource>()),
    );

    Get.lazyPut<CategoryController>(
      () => CategoryController(categoryRepo: Get.find<CategoryRepo>()),
    );
  }
}
