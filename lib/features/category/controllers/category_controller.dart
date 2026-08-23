import 'package:get/get.dart';
import 'package:saku_kita_app/features/category/models/category_response.dart';
import 'package:saku_kita_app/features/category/repo/category_repo.dart';

// class CategoryModel {
//   final String id;
//   final String name;
//   final bool isSystem;

//   const CategoryModel({
//     required this.id,
//     required this.name,
//     required this.isSystem,
//   });
// }

class CategoryController extends GetxController {
  final RxBool isLoading = false.obs;
  final Rx<String?> errorMessage = Rx<String?>(null);
  final RxList<CategoryResponse> categories = <CategoryResponse>[].obs;

  final CategoryRepo categoryRepo;

  CategoryController({required this.categoryRepo});

  @override
  Future<void> onReady() async {
    // TODO: implement onReady
    super.onReady();
    await fetchCategories();
  }

  Future<void> fetchCategories() async {
    isLoading.value = true;
    errorMessage.value = null;

    try {
      final result = await categoryRepo.getList();

      categories.assignAll(result!);
    } catch (e) {
      Get.snackbar(
        'Get category gagal',
        e.toString().replaceFirst('Exception: ', ''),
        snackPosition: SnackPosition.BOTTOM,
      );
      // errorMessage.value = 'Gagal memuat kategori. Coba lagi.';
    } finally {
      isLoading.value = false;
    }
  }
}
