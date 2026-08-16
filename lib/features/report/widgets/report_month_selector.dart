import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:saku_kita_app/features/report/controllers/report_controller.dart';

class ReportMonthSelector extends GetView<ReportController> {
  const ReportMonthSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: [
          GestureDetector(
            onTap: controller.previousMonth,
            child: const Icon(Icons.chevron_left_rounded, size: 24),
          ),

          const SizedBox(width: 6),

          Expanded(
            child: Container(
              height: 34,
              alignment: Alignment.center,
              child: Text(controller.monthLabel),
            ),
          ),

          const SizedBox(width: 6),

          GestureDetector(
            onTap: controller.nextMonth,
            child: const Icon(Icons.chevron_right_rounded, size: 24),
          ),
        ],
      ),
    );
  }
}
