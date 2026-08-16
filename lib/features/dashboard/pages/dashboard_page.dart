import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saku_kita_app/core/widgets/app_bottom_navigation.dart';
import 'package:saku_kita_app/core/widgets/app_floating_action_button.dart';
import 'package:saku_kita_app/features/dashboard/widgets/home_menu_section.dart';

import '../../../app/theme/app_colors.dart';
import '../controllers/dashboard_controller.dart';
import '../widgets/dashboard_header.dart';
import '../widgets/balance_card.dart';
import '../widgets/monthly_summary.dart';
import '../widgets/expense_category.dart';
import '../widgets/recent_transactions.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DashboardHeader(),

              const SizedBox(height: 20),

              const BalanceCard(),

              const SizedBox(height: 20),

              const HomeMenuSection(),

              const SizedBox(height: 24),

              const MonthlySummary(),

              const SizedBox(height: 24),

              const ExpenseCategory(),

              const SizedBox(height: 24),

              const RecentTransactions(),

              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
