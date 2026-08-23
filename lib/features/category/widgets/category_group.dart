import 'package:flutter/material.dart';
import 'package:saku_kita_app/features/category/models/category_response.dart';
import 'package:saku_kita_app/features/category/widgets/category_tile.dart';

class CategoryGroup extends StatelessWidget {
  const CategoryGroup({required this.categories});

  final List<CategoryResponse> categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          for (int i = 0; i < categories.length; i++) ...[
            CategoryTile(category: categories[i]),
            if (i != categories.length - 1)
              const Divider(height: 1, indent: 68, color: Color(0xFFF0F0F5)),
          ],
        ],
      ),
    );
  }
}
