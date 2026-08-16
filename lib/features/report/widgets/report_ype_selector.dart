import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/theme/app_colors.dart';
import '../controllers/report_controller.dart';

class ReportTypeSelector extends GetView<ReportController> {
  const ReportTypeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final selected = controller.selectedType.value;

      return Container(
        height: 34,
        decoration: BoxDecoration(
          color: const Color(0xFFEFF1F2),
          borderRadius: BorderRadius.circular(9),
        ),
        child: Row(
          children: [
            _Item(
              title: 'Pengeluaran',
              selected: selected == 0,
              onTap: () {
                controller.changeType(0);
              },
            ),

            _Item(
              title: 'Pemasukan',
              selected: selected == 1,
              onTap: () {
                controller.changeType(1);
              },
            ),
          ],
        ),
      );
    });
  }
}

class _Item extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const _Item({
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
            borderRadius: BorderRadius.circular(9),
          ),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: selected ? Colors.white : const Color(0xFF4B5563),
            ),
          ),
        ),
      ),
    );
  }
}
