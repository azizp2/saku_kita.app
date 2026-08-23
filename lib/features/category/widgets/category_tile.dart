import 'package:flutter/material.dart';
import 'package:saku_kita_app/features/category/models/category_response.dart';

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
    final color = _colorFor(category.name);
    final initial = category.name.isNotEmpty
        ? category.name[0].toUpperCase()
        : "?";

    return InkWell(
      onTap: () {
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
              child: Text(
                initial,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
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
            if (category.isSystem)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F0F5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  "default",
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF8B8B9E),
                  ),
                ),
              )
            else
              const Icon(Icons.chevron_right_rounded, color: Color(0xFFC4C4D0)),
          ],
        ),
      ),
    );
  }
}
