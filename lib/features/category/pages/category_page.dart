import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saku_kita_app/app/theme/app_colors.dart';
import 'package:saku_kita_app/core/widgets/empty_state.dart';
import 'package:saku_kita_app/features/category/controllers/category_controller.dart';
import 'package:saku_kita_app/features/category/widgets/category_form_bottom_sheet.dart';
import 'package:saku_kita_app/features/category/widgets/category_section_label.dart';
import 'package:saku_kita_app/features/category/widgets/category_group.dart';

class CategoryPage extends GetView<CategoryController> {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7FB),
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        surfaceTintColor: AppColors.surface,
        iconTheme: IconThemeData(color: AppColors.surface),
        title: Text(
          "Category",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: AppColors.surface,
          ),
        ),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await controller.fetchCategories();
          },
          color: AppColors.primary,
          backgroundColor: AppColors.surface,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Obx(() {
              if (controller.isLoading.value && controller.categories.isEmpty) {
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 16),
                      Text('Memuat data kategori...'),
                    ],
                  ),
                );
              }

              if (controller.categories.isEmpty) {
                return const Center(child: EmptyState());
              }

              final expense = controller.categories
                  .where((c) => c.type == 'expense')
                  .toList();

              final income = controller.categories
                  .where((c) => c.type != 'expense')
                  .toList();

              return SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (expense.isNotEmpty) ...[
                      const SectionLabel(text: "Expense"),
                      const SizedBox(height: 10),
                      CategoryGroup(categories: expense),
                      const SizedBox(height: 24),
                    ],
                    if (income.isNotEmpty) ...[
                      const SectionLabel(text: "Income"),
                      const SizedBox(height: 10),
                      CategoryGroup(categories: income),
                    ],
                    const SizedBox(height: 12),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.bottomSheet(
            const CategoryFormBottomSheet(),
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
          );
        },
        backgroundColor: AppColors.primary,
        icon: const Icon(Icons.add_rounded, color: Colors.white),
        label: const Text(
          "Kategori Baru",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
