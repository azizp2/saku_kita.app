import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saku_kita_app/core/widgets/app_bottom_navigation.dart';

import '../../../app/theme/app_colors.dart';
import '../controllers/wallet_controller.dart';
import '../widgets/wallet_header.dart';
import '../widgets/wallet_balance_card.dart';
import '../widgets/wallet_item.dart';
import '../widgets/financial_goal_item.dart';

class WalletPage extends GetView<WalletController> {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Wallet',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: AppColors.text,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WalletBalanceCard(
                balance: controller.walletBalance.value,
                onTap: () {
                  controller.openWallet('Wallet Utama');
                },
              ),

              const SizedBox(height: 12),

              WalletItem(
                title: 'Tabungan Bersama',
                amount: controller.sharedSaving.value,
                icon: Icons.savings_rounded,
                iconColor: const Color(0xFFFF9B52),
                iconBackground: const Color(0xFFFFF3E9),
                onTap: () {
                  controller.openWallet('Tabungan Bersama');
                },
              ),

              const SizedBox(height: 12),

              WalletItem(
                title: 'Dana Darurat',
                amount: controller.emergencyFund.value,
                icon: Icons.health_and_safety_outlined,
                iconColor: const Color(0xFF43A985),
                iconBackground: const Color(0xFFEAF8F3),
                onTap: () {
                  controller.openWallet('Dana Darurat');
                },
              ),

              const SizedBox(height: 24),

              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Tujuan Keuangan',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: AppColors.text,
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      // TODO: lihat semua tujuan
                    },
                    child: const Text(
                      'Lihat semua',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 14),

              Obx(
                () => Column(
                  children: [
                    ...controller.financialGoals.map((goal) {
                      final current = goal['current'] as double;

                      final target = goal['target'] as double;

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: FinancialGoalItem(
                          title: goal['title'],
                          icon: goal['icon'],
                          current: controller.formatCurrency(current),
                          target: controller.formatCurrency(target),
                          percentage: controller.getPercentage(current, target),
                        ),
                      );
                    }),

                    const SizedBox(height: 2),

                    GestureDetector(
                      onTap: controller.addFinancialGoal,
                      child: Container(
                        width: double.infinity,
                        height: 38,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add, size: 16, color: AppColors.primary),
                            SizedBox(width: 5),
                            Text(
                              'Buat Tujuan Baru',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 90),
            ],
          ),
        ),
      ),
    );
  }
}
