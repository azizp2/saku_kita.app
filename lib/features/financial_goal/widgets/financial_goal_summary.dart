import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../app/theme/app_colors.dart';

class FinancialGoalSummary extends StatelessWidget {
  final double totalCollected;
  final String Function(double) formatCurrency;

  const FinancialGoalSummary({
    super.key,
    required this.totalCollected,
    required this.formatCurrency,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 94,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: const Color(0xFFF0F2F3),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Total Terkumpul',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF4B5563),
                  ),
                ),

                const SizedBox(height: 7),

                Text(
                  formatCurrency(totalCollected),
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w800,
                    color: AppColors.text,
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            right: -4,
            bottom: -8,
            child: SvgPicture.asset(
              'assets/images/undraw_suburbs_zzmj.svg',
              width: 105,
              height: 88,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
