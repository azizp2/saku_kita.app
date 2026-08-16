import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/routes/app_routes.dart';
import '../../../app/theme/app_colors.dart';

class HomeMenuSection extends StatelessWidget {
  const HomeMenuSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Akses Cepat',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: AppColors.text,
          ),
        ),

        const SizedBox(height: 14),

        SizedBox(
          height: 82,
          child: ListView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            children: [
              _QuickMenuItem(
                icon: Icons.account_balance_wallet_outlined,
                title: 'Dompet',
                onTap: () {
                  Get.toNamed(AppRoutes.wallet);
                },
              ),

              _QuickMenuItem(
                icon: Icons.insert_chart_outlined_rounded,
                title: 'Laporan',
                onTap: () {
                  Get.toNamed(AppRoutes.report);
                },
              ),

              _QuickMenuItem(
                icon: Icons.flag_outlined,
                title: 'Target',
                onTap: () {
                  Get.toNamed(AppRoutes.financialGoal);
                },
              ),

              _QuickMenuItem(
                icon: Icons.savings_outlined,
                title: 'Tabungan',
                onTap: () {
                  // nanti
                },
              ),

              _QuickMenuItem(
                icon: Icons.category_outlined,
                title: 'Kategori',
                onTap: () {
                  // nanti
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _QuickMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _QuickMenuItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: SizedBox(
          width: 62,
          child: Column(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.08),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 22, color: AppColors.primary),
              ),

              const SizedBox(height: 7),

              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: AppColors.text,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
