import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../controllers/budget_controller.dart';

class BudgetCategoryItem extends StatelessWidget {
  final BudgetCategoryModel category;
  final VoidCallback? onTap;

  const BudgetCategoryItem({super.key, required this.category, this.onTap});

  String formatCurrency(double value) {
    final formatted = value
        .toStringAsFixed(0)
        .replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (match) => '.');

    return 'Rp $formatted';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: category.color.withValues(alpha: 0.14),
              borderRadius: BorderRadius.circular(11),
            ),
            child: Icon(category.icon, size: 20, color: category.color),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        category.name,
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: AppColors.text,
                        ),
                      ),
                    ),

                    Text(
                      '${category.percentage}%',
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF4B5563),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 5),

                Row(
                  children: [
                    Text(
                      formatCurrency(category.used),
                      style: const TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF4B5563),
                      ),
                    ),

                    const Text(
                      ' / ',
                      style: TextStyle(fontSize: 9, color: Color(0xFF9CA3AF)),
                    ),

                    Text(
                      formatCurrency(category.limit),
                      style: const TextStyle(
                        fontSize: 9,
                        color: Color(0xFF9CA3AF),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: category.progress,
                    minHeight: 6,
                    backgroundColor: const Color(0xFFE5E7EB),
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
