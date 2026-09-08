import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:saku_kita_app/app/theme/app_colors.dart';
import 'package:saku_kita_app/core/constants/category_icons.dart';
import 'package:saku_kita_app/core/utils/color_utils.dart';
import 'package:saku_kita_app/core/utils/currency_formatter.dart';
import 'package:saku_kita_app/features/wallets/controllers/wallet_controller.dart';
import 'package:saku_kita_app/features/wallets/models/wallet_response.dart';
import 'package:saku_kita_app/features/wallets/widgets/wallet_form_bottom_sheet.dart';

class WalletItem extends StatelessWidget {
  const WalletItem({super.key, this.wallet});

  final WalletResponse? wallet;

  @override
  Widget build(BuildContext context) {
    final color = hexToColor(
      wallet?.color,
      fallback: const Color.fromARGB(255, 250, 250, 252),
    );
    final icon = CategoryIcons.getIcon(wallet?.icon ?? 'wallet');
    final isMainWallet = wallet?.isMainWallet ?? false;

    return GestureDetector(
      onTap: () {
        Get.bottomSheet(
          WalletFormBottomSheet(wallet: wallet),
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
        );
      },
      child: Container(
        width: double.infinity,
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: wallet?.color != null
                    ? color.withOpacity(0.12)
                    : AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 24),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        wallet?.name ?? '',
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF4B5563),
                        ),
                      ),

                      const SizedBox(width: 6),
                    ],
                  ),

                  const SizedBox(height: 5),

                  Text(
                    CurrencyFormatter.format(wallet!.balance),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF111827),
                    ),
                  ),
                ],
              ),
            ),

            Row(
              children: [
                if (!isMainWallet)
                  IconButton(
                    onPressed: () {
                      _showSetMainConfirmation(context);
                    },
                    tooltip: 'Jadikan wallet utama',
                    icon: Icon(
                      Icons.star_outline_rounded,
                      size: 22,
                      color: Colors.amber.shade600,
                    ),
                  ),

                if (!isMainWallet)
                  IconButton(
                    onPressed: () {
                      _showDeleteConfirmation(context);
                    },
                    tooltip: 'Hapus wallet',
                    icon: const Icon(
                      Icons.delete_outline_rounded,
                      size: 22,
                      color: AppColors.danger,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showSetMainConfirmation(BuildContext context) {
    Get.dialog(
      AlertDialog(
        title: Row(
          children: [
            Icon(Icons.star, color: Colors.amber.shade600),
            const SizedBox(width: 8),
            const Text(
              'Jadikan Wallet Utama',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        content: Text(
          'Apakah kamu yakin ingin menjadikan "${wallet?.name}" sebagai wallet utama?',
        ),
        actions: [
          TextButton(onPressed: () => Get.back(), child: const Text('Batal')),
          ElevatedButton(
            onPressed: () {
              Get.back(); // Tutup dialog
              final controller = Get.find<WalletController>();
              controller.setMainWallet(wallet!.id); // Panggil fungsi
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber.shade600,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('Jadikan Utama'),
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context) {
    Get.dialog(
      AlertDialog(
        title: Row(
          children: [
            const Text(
              'Hapus Wallet?',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        content: Text('Apakah kamu yakin ingin menghapus "${wallet?.name}"?'),
        actions: [
          TextButton(onPressed: () => Get.back(), child: const Text('Batal')),
          ElevatedButton(
            onPressed: () {
              Get.back(); // Tutup dialog
              final controller = Get.find<WalletController>();
              controller.delete(wallet!.id);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.danger,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('Hapus'),
          ),
        ],
      ),
    );
  }
}
