import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saku_kita_app/app/theme/app_colors.dart';
import 'package:saku_kita_app/core/utils/color_utils.dart';
import 'package:saku_kita_app/features/category/models/category_request.dart';
import 'package:saku_kita_app/features/category/models/category_response.dart';
import 'package:saku_kita_app/features/category/repo/category_repo.dart';

class CategoryController extends GetxController {
  final CategoryRepo categoryRepo;

  CategoryController({required this.categoryRepo});

  final RxBool isLoading = false.obs;
  final Rx<String?> errorMessage = Rx<String?>(null);
  final RxList<CategoryResponse> categories = <CategoryResponse>[].obs;

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();

  final List<String> categoryTypes = ['Income', 'Expense'];

  final Rxn<Color> selectedColor = Rxn<Color>();
  final Rxn<String> selectedIcon = Rxn<String>();

  final RxString selectedType = 'expense'.obs;
  final RxBool isSubmitting = false.obs;

  CategoryResponse? editingCategory;

  @override
  Future<void> onReady() async {
    super.onReady();
    await fetchCategories();
  }

  @override
  void onClose() {
    nameController.dispose();
    super.onClose();
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
    } finally {
      isLoading.value = false;
    }
  }

  void setEditCategory(CategoryResponse category) {
    editingCategory = category;

    nameController.text = category.name;
    selectedType.value = category.type!;
    selectedIcon.value = category.icon;

    selectedColor.value = hexToColor(
      category.color,
      fallback: AppColors.primary,
    );
  }

  void setIcon(String key) {
    selectedIcon.value = key;
  }

  void setColor(Color color) {
    selectedColor.value = color;
  }

  void setType(String value) {
    selectedType.value = value;
  }

  void resetForm() {
    editingCategory = null;
    nameController.clear();
    selectedIcon.value = null;
    selectedColor.value = null;
  }

  Future<void> submitCategory() async {
    if (!formKey.currentState!.validate()) return;

    isLoading.value = true;

    try {
      final request = CategoryRequest(
        name: nameController.text.trim(),
        type: selectedType.value,
        color: selectedColor.value != null
            ? colorToHex(selectedColor.value!)
            : '',
        icon: selectedIcon.value,
      );

      final result = editingCategory != null
          ? await categoryRepo.update(editingCategory!.id, request)
          : await categoryRepo.create(request);

      if (result) {
        await fetchCategories();
      }

      resetForm();
      Get.back();

      Get.snackbar(
        'Sukses',
        'Category berhasil ${editingCategory != null ? 'ditambahkan' : 'diupdate'}',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString().replaceFirst('Exception: ', ''),
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteCategory(String id) async {
    isLoading.value = true;

    try {
      await categoryRepo.remoteDataSource.delete(id);

      Get.snackbar(
        'Sukses',
        'Category berhasil dihapus.',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString().replaceFirst('Exception: ', ''),
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
