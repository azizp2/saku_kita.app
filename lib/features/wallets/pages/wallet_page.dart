import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saku_kita_app/core/utils/currency_formatter.dart';
import 'package:saku_kita_app/core/widgets/empty_state.dart';
import 'package:saku_kita_app/features/wallets/widgets/wallet_form_bottom_sheet.dart';

import '../../../app/theme/app_colors.dart';
import '../controllers/wallet_controller.dart';
import '../widgets/wallet_balance_card.dart';
import '../widgets/wallet_item.dart';

class WalletPage extends GetView<WalletController> {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        surfaceTintColor: AppColors.surface,
        iconTheme: IconThemeData(color: AppColors.surface),
        title: Text(
          'Wallet',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: AppColors.surface,
          ),
        ),
      ),
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await controller.fetchWallets();
          },
          color: AppColors.primary,
          backgroundColor: AppColors.surface,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(() {
              if (controller.isLoading.value && controller.wallets.isEmpty) {
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 16),
                      Text('Memuat data wallet...'),
                    ],
                  ),
                );
              }

              final mainWallet = controller.mainWallet;
              final otherWallets = controller.otherWallets;

              if (controller.wallets.isEmpty) {
                return const Center(child: EmptyState());
              }

              return SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (mainWallet != null)
                      WalletBalanceCard(
                        title: mainWallet.name,
                        balance: CurrencyFormatter.format(mainWallet.balance),
                        onTap: () {
                          controller.openWallet(mainWallet.id);
                        },
                      ),

                    if (mainWallet != null && otherWallets.isNotEmpty)
                      const SizedBox(height: 12),

                    ...otherWallets.map((wallet) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: WalletItem(wallet: wallet),
                      );
                    }),

                    const SizedBox(height: 12),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.bottomSheet(
            const WalletFormBottomSheet(),
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            enableDrag: true,
            persistent: true,
          );
        },
        backgroundColor: AppColors.primary,
        icon: const Icon(Icons.add_rounded, color: Colors.white),
        label: const Text(
          "Tambah Wallet",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
