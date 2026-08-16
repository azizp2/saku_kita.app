import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';

class FinancialGoalHeader extends StatelessWidget {
  final VoidCallback onBack;
  final VoidCallback onAdd;

  const FinancialGoalHeader({
    super.key,
    required this.onBack,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onBack,
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 19,
            color: AppColors.text,
          ),
        ),

        const Expanded(
          child: Text(
            'Tujuan Keuangan',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w800,
              color: AppColors.text,
            ),
          ),
        ),

        GestureDetector(
          onTap: onAdd,
          child: const Icon(Icons.add, size: 25, color: AppColors.text),
        ),
      ],
    );
  }
}
