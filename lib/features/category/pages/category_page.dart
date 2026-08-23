import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saku_kita_app/app/theme/app_colors.dart';
import 'package:saku_kita_app/core/widgets/app_not_found.dart';
import 'package:saku_kita_app/features/category/controllers/category_controller.dart';
import 'package:saku_kita_app/features/category/widgets/category_section_label.dart';
import 'package:saku_kita_app/features/category/widgets/category_group.dart';

class CategoryPage extends GetView<CategoryController> {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7FB),
      appBar: AppBar(
        title: Text(
          "Category",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: AppColors.text,
          ),
        ),
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

          final systemCategories = controller.categories
              .where((c) => c.isSystem)
              .toList();
          final customCategories = controller.categories
              .where((c) => !c.isSystem)
              .toList();

          return ListView(
            padding: const EdgeInsets.fromLTRB(12, 16, 12, 24),
            children: [
              if (systemCategories.isNotEmpty) ...[
                SectionLabel(text: "Default"),
                const SizedBox(height: 10),
                CategoryGroup(categories: systemCategories),
                const SizedBox(height: 24),
              ],
              if (customCategories.isNotEmpty) ...[
                const SectionLabel(text: "Kategori Saya"),
                const SizedBox(height: 10),
                CategoryGroup(categories: customCategories),
              ],
            ],
          );
        }),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // TODO: navigasi ke halaman tambah kategori
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
