import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:saku_kita_app/core/constants/category_icons.dart';
import 'package:saku_kita_app/core/utils/color_utils.dart';
import 'package:saku_kita_app/features/category/controllers/category_controller.dart';
import 'package:saku_kita_app/features/category/models/category_response.dart';
import 'package:saku_kita_app/features/category/widgets/category_form_bottom_sheet.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({required this.category});

  final CategoryResponse category;

  static const _palette = [
    Color(0xFF6C5CE7),
    Color(0xFF00B894),
    Color(0xFFFF7675),
    Color(0xFFFDCB6E),
    Color(0xFF0984E3),
    Color(0xFFE17055),
  ];

  Color _colorFor(String seed) {
    final index =
        seed.codeUnits.fold<int>(0, (a, b) => a + b) % _palette.length;
    return _palette[index];
  }

  @override
  Widget build(BuildContext context) {
    // final color = _colorFor(category.name);
    // final initial = category.name.isNotEmpty && category.icon!.isNotEmpty
    //     ? category.icon![0].toUpperCase()
    //     : "?";

    final color = hexToColor(category.color, fallback: const Color(0xFF6C5CE7));
    final icon = CategoryIcons.getIcon(category.icon);
    final initial = category.name.isNotEmpty
        ? category.name[0].toUpperCase()
        : "?";

    return InkWell(
      onTap: () {
        final categoryId = category.id;
        Get.bottomSheet(
          CategoryFormBottomSheet(category: category),
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
        );
        // TODO: navigasi ke detail/edit kategori
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: color.withOpacity(0.12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: 20),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                category.name,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A1A2E),
                ),
              ),
            ),
            const Icon(Icons.chevron_right_rounded, color: Color(0xFFC4C4D0)),
            IconButton(
              onPressed: () => _showDeleteConfirmation(context),
              icon: const Icon(
                Icons.delete_outline_rounded,
                color: Colors.redAccent,
                size: 21,
              ),
              tooltip: 'Delete category',
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context) {
    Get.dialog(
      AlertDialog(
        title: const Text(
          'Hapus Category?',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Text(
          'Category "${category.name}" akan dihapus. '
          'Apakah kamu yakin?',
        ),
        actions: [
          TextButton(onPressed: () => Get.back(), child: const Text('Batal')),
          ElevatedButton(
            onPressed: () {
              Get.back();

              final controller = Get.find<CategoryController>();

              controller.deleteCategory(category.id);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              foregroundColor: Colors.white,
              elevation: 0,
            ),
            child: const Text('Hapus'),
          ),
        ],
      ),
    );
  }
}
