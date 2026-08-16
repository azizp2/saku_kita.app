import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/theme/app_colors.dart';
import '../controllers/wallet_controller.dart';

class WalletHeader extends GetView<WalletController> {
  const WalletHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Text(
            'Wallet',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: AppColors.text,
            ),
          ),
        ),

        GestureDetector(
          onTap: controller.addWallet,
          child: const Icon(Icons.add, size: 27, color: AppColors.text),
        ),
      ],
    );
  }
}
