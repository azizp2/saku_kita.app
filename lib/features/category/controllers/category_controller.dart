import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:saku_kita_app/features/category/models/category_request.dart';
import 'package:saku_kita_app/features/category/models/category_response.dart';
import 'package:saku_kita_app/features/category/repo/category_repo.dart';

class CategoryController extends GetxController {
  final RxBool isLoading = false.obs;
  final Rx<String?> errorMessage = Rx<String?>(null);
  final RxList<CategoryResponse> categories = <CategoryResponse>[].obs;

  final CategoryRepo categoryRepo;

  CategoryController({required this.categoryRepo});

  @override
  Future<void> onReady() async {
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

  // State and logic create category
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();

  final List<String> categoryTypes = ['Income', 'Expense'];
  final selectedColor = Rxn<Color>(); // default value, non-nullable
  Rxn<String> selectedIcon = Rxn<String>();

  var selectedType = 'expense'.obs;
  var isSubmitting = false.obs;

  final List<Color> colorPalette = [
    const Color(0xFFEF4444), // red
    const Color(0xFFF97316), // orange
    const Color(0xFFF59E0B), // amber
    const Color(0xFFEAB308), // yellow
    const Color(0xFF84CC16), // lime
    const Color(0xFF22C55E), // green
    const Color(0xFF14B8A6), // teal
    const Color(0xFF06B6D4), // cyan
    const Color(0xFF3B82F6), // blue
    const Color(0xFF6366F1), // indigo
    const Color(0xFF8B5CF6), // violet
    const Color(0xFFEC4899), // pink
    const Color(0xFFF43F5E), // rose
    const Color(0xFF64748B), // slate
  ];

  void setIcon(String key) => selectedIcon.value = key;

  void setColor(Color color) => selectedColor.value = color;

  void setType(String value) => selectedType.value = value;

  void resetForm() {
    nameController.clear();
    selectedIcon.value = null;
    selectedColor.value = null;
  }

  Future<void> submitCategory() async {
    if (!formKey.currentState!.validate()) return;

    isSubmitting.value = true;
    try {
      final request = CategoryRequest(
        name: nameController.text.trim(),
        type: selectedType.value,
        color: selectedColor.value != null
            ? colorToHex(selectedColor.value!)
            : "",
        icon: selectedIcon.value,
      );
      final result = await categoryRepo.create(request);
      if (result) await fetchCategories();

      isSubmitting.value = false;

      WidgetsBinding.instance.addPostFrameCallback((_) => resetForm());
      Get.snackbar(
        'Sukses',
        'Category berhasil ditambahkan',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      isSubmitting.value = false;
      Get.snackbar(
        'Error',
        e.toString().replaceFirst('Exception: ', ''),
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isSubmitting.value = false;
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    super.onClose();
  }
}
