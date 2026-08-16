import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/theme/app_colors.dart';
import '../controllers/financial_goal_controller.dart';

class FinancialGoalTabs extends GetView<FinancialGoalController> {
  const FinancialGoalTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: 34,
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: const Color(0xFFEFF1F2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            _TabItem(
              title: 'Aktif',
              selected: controller.selectedTab.value == 0,
              onTap: () {
                controller.changeTab(0);
              },
            ),
            _TabItem(
              title: 'Selesai',
              selected: controller.selectedTab.value == 1,
              onTap: () {
                controller.changeTab(1);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _TabItem extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const _TabItem({
    required this.title,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: selected ? AppColors.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: selected ? Colors.white : const Color(0xFF4B5563),
            ),
          ),
        ),
      ),
    );
  }
}
