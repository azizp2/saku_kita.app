import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/theme/app_colors.dart';
import '../controllers/transaction_controller.dart';

class TransactionHeader extends GetView<TransactionController> {
  const TransactionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Text(
            'Transaksi',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: AppColors.text,
            ),
          ),
        ),

        GestureDetector(
          onTap: controller.searchTransaction,
          child: const Icon(
            Icons.search_rounded,
            size: 24,
            color: AppColors.text,
          ),
        ),

        const SizedBox(width: 18),

        GestureDetector(
          onTap: controller.openFilter,
          child: const Icon(
            Icons.tune_rounded,
            size: 22,
            color: AppColors.text,
          ),
        ),
      ],
    );
  }
}
