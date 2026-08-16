import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saku_kita_app/core/widgets/app_bottom_navigation.dart';
import 'package:saku_kita_app/features/financial_goal/widgets/financial_goal_header.dart';
import 'package:saku_kita_app/features/financial_goal/widgets/financial_goal_tabs.dart';

import '../../../app/theme/app_colors.dart';
import '../controllers/financial_goal_controller.dart';
import '../widgets/financial_goal_card.dart';
import '../widgets/financial_goal_summary.dart';

class FinancialGoalPage extends GetView<FinancialGoalController> {
  const FinancialGoalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FinancialGoalHeader(onBack: Get.back, onAdd: controller.addGoal),
              const SizedBox(height: 18),

              FinancialGoalTabs(),

              const SizedBox(height: 18),

              Obx(() {
                final active = controller.selectedTab.value == 0;

                final items = active
                    ? controller.goals
                    : controller.completedGoals;

                if (items.isEmpty) {
                  return const _EmptyGoal();
                }

                return Column(
                  children: items
                      .map(
                        (goal) => Padding(
                          padding: const EdgeInsets.only(bottom: 14),
                          child: FinancialGoalCard(
                            goal: goal,
                            controller: controller,
                            onTap: () {
                              controller.openGoal(goal);
                            },
                          ),
                        ),
                      )
                      .toList(),
                );
              }),

              const SizedBox(height: 16),

              Obx(
                () => FinancialGoalSummary(
                  totalCollected: controller.totalCollected,
                  formatCurrency: controller.formatCurrency,
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: const AppBottomNavigation(currentIndex: 0),

      floatingActionButton: FloatingActionButton(
        onPressed: controller.addGoal,
        backgroundColor: AppColors.primary,
        elevation: 4,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, size: 30, color: Colors.white),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _EmptyGoal extends StatelessWidget {
  const _EmptyGoal();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: const Column(
        children: [
          Icon(Icons.flag_outlined, size: 45, color: Color(0xFFD1D5DB)),
          SizedBox(height: 12),
          Text(
            'Belum ada tujuan selesai',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xFF9CA3AF),
            ),
          ),
        ],
      ),
    );
  }
}
