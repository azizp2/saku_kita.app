import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/theme/app_colors.dart';
import '../controllers/transaction_controller.dart';

class TransactionFilter extends GetView<TransactionController> {
  const TransactionFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: List.generate(controller.filters.length, (index) {
          final selected = controller.selectedFilter.value == index;

          return Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                right: index == controller.filters.length - 1 ? 0 : 8,
              ),
              child: GestureDetector(
                onTap: () {
                  controller.changeFilter(index);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  height: 32,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: selected
                        ? AppColors.primary
                        : const Color(0xFFF0F2F3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    controller.filters[index],
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: selected ? Colors.white : const Color(0xFF6B7280),
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
