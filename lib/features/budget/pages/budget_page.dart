import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saku_kita_app/core/widgets/app_bottom_navigation.dart';

import '../../../app/theme/app_colors.dart';
import '../controllers/budget_controller.dart';
import '../widgets/budget_header.dart';
import '../widgets/monthly_budget_card.dart';
import '../widgets/budget_category_item.dart';

class BudgetPage extends GetView<BudgetController> {
  const BudgetPage({super.key});

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
              const BudgetHeader(),

              const SizedBox(height: 18),

              Obx(
                () => MonthlyBudgetCard(
                  used: controller.totalUsed.value,
                  total: controller.totalBudget.value,
                  percentage: controller.totalPercentage,
                ),
              ),

              const SizedBox(height: 24),

              Obx(
                () => Column(
                  children: controller.budgetCategories
                      .map(
                        (category) => Padding(
                          padding: const EdgeInsets.only(bottom: 18),
                          child: SizedBox(
                            height: 55,
                            child: BudgetCategoryItem(
                              category: category,
                              onTap: () {
                                controller.openCategory(category);
                              },
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: const AppBottomNavigation(currentIndex: 2),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.snackbar(
            'Tambah Transaksi',
            'Form tambah transaksi akan dibuka.',
            snackPosition: SnackPosition.BOTTOM,
          );
        },
        backgroundColor: AppColors.primary,
        elevation: 4,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, size: 30, color: Colors.white),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
