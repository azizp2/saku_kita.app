import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';

class MonthlyBudgetCard extends StatelessWidget {
  final double used;
  final double total;
  final int percentage;

  const MonthlyBudgetCard({
    super.key,
    required this.used,
    required this.total,
    required this.percentage,
  });

  String formatCurrency(double value) {
    final formatted = value
        .toStringAsFixed(0)
        .replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (match) => '.');

    return 'Rp $formatted';
  }

  @override
  Widget build(BuildContext context) {
    final progress = total <= 0 ? 0.0 : (used / total).clamp(0.0, 1.0);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F2F3),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Budget Bulan Ini',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              color: AppColors.text,
            ),
          ),

          const SizedBox(height: 4),

          Row(
            children: [
              const Text(
                '1 - 31 Mei 2025',
                style: TextStyle(fontSize: 10, color: Color(0xFF9CA3AF)),
              ),

              const SizedBox(width: 4),

              const Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 14,
                color: Color(0xFF9CA3AF),
              ),
            ],
          ),

          const SizedBox(height: 14),

          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                formatCurrency(used),
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  color: AppColors.primary,
                ),
              ),

              const Text(
                ' / ',
                style: TextStyle(fontSize: 10, color: Color(0xFF9CA3AF)),
              ),

              Text(
                formatCurrency(total),
                style: const TextStyle(fontSize: 10, color: Color(0xFF6B7280)),
              ),

              const Spacer(),

              Text(
                '$percentage%',
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF4B5563),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 7,
              backgroundColor: const Color(0xFFDCE1E2),
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
