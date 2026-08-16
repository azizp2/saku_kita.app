import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';

class MonthlySummary extends StatelessWidget {
  const MonthlySummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Ringkasan Bulan Ini',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w800,
            color: AppColors.text,
          ),
        ),

        const SizedBox(height: 4),

        Row(
          children: [
            const Text(
              '1 - 31 Mei 2025',
              style: TextStyle(fontSize: 12, color: Color(0xFF9CA3AF)),
            ),
            const Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 16,
              color: Color(0xFF9CA3AF),
            ),
          ],
        ),

        const SizedBox(height: 12),

        Row(
          children: [
            Expanded(
              child: _SummaryCard(
                title: 'Pemasukan',
                amount: 'Rp 18.750.000',
                color: const Color(0xFF249E7C),
                backgroundColor: const Color(0xFFF1FBF8),
              ),
            ),

            const SizedBox(width: 10),

            Expanded(
              child: _SummaryCard(
                title: 'Pengeluaran',
                amount: 'Rp 6.300.000',
                color: const Color(0xFFE95454),
                backgroundColor: const Color(0xFFFFF4F4),
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),

        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sisa Saldo',
                      style: TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Rp 12.450.000',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: AppColors.text,
                      ),
                    ),
                  ],
                ),
              ),

              Row(
                children: [
                  const Icon(
                    Icons.arrow_drop_up_rounded,
                    color: Color(0xFF22A47D),
                  ),
                  Text(
                    '22%',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF22A47D),
                    ),
                  ),
                  const Text(
                    ' dari April',
                    style: TextStyle(fontSize: 11, color: Color(0xFF9CA3AF)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final String title;
  final String amount;
  final Color color;
  final Color backgroundColor;

  const _SummaryCard({
    required this.title,
    required this.amount,
    required this.color,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            amount,
            style: TextStyle(
              fontSize: 14,
              color: color,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}
