import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/theme/app_colors.dart';
import '../controllers/budget_controller.dart';

class BudgetHeader extends GetView<BudgetController> {
  const BudgetHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Text(
            'Budget',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: AppColors.text,
            ),
          ),
        ),

        GestureDetector(
          onTap: controller.addBudget,
          child: const Icon(Icons.add, size: 27, color: AppColors.text),
        ),
      ],
    );
  }
}
