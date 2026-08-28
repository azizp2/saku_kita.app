import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saku_kita_app/app/theme/app_colors.dart';
import 'package:saku_kita_app/core/widgets/app_not_found.dart';
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
        actions: [
          IconButton(
            icon: Icon(Icons.refresh, color: AppColors.surface),
            onPressed: () {
              controller.fetchCategories();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.categories.isEmpty) {
            return AppNotFound(
              icon: Icons.list_rounded,
              title: "Belum Ada Kategori",
              description:
                  "Tambahkan kategori untuk mulai\nmencatat transaksimu",
            );
          }

          final expense = controller.categories
              .where((c) => c.type == 'expense')
              .toList();

          final income = controller.categories
              .where((c) => c.type != 'expense')
              .toList();

          return ListView(
            padding: const EdgeInsets.fromLTRB(12, 16, 12, 24),
            children: [
              if (expense.isNotEmpty) ...[
                SectionLabel(text: "Expense"),
                const SizedBox(height: 10),
                CategoryGroup(categories: expense),
                const SizedBox(height: 24),
              ],
              if (income.isNotEmpty) ...[
                const SectionLabel(text: "Income"),
                const SizedBox(height: 10),
                CategoryGroup(categories: income),
              ],
            ],
          );
        }),
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
