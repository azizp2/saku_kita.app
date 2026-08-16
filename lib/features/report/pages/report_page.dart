import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saku_kita_app/features/report/widgets/report_ype_selector.dart';

import '../../../app/theme/app_colors.dart';
import '../controllers/report_controller.dart';
import '../widgets/report_month_selector.dart';
import '../widgets/expense_line_chart.dart';
import '../widgets/expense_category_chart.dart';

class ReportPage extends GetView<ReportController> {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Report',
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
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 18),

              const ReportMonthSelector(),

              const SizedBox(height: 12),

              const ReportTypeSelector(),

              const SizedBox(height: 24),

              _TotalSection(controller: controller),

              const SizedBox(height: 12),

              ExpenseLineChart(data: controller.expenseChartData),

              const SizedBox(height: 22),

              const Text(
                'Pengeluaran per Kategori',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  color: AppColors.text,
                ),
              ),

              const SizedBox(height: 14),

              ExpenseCategoryChart(
                categories: controller.expenseCategories,
                formatCurrency: controller.formatCurrency,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TotalSection extends StatelessWidget {
  final ReportController controller;

  const _TotalSection({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isExpense = controller.selectedType.value == 0;

      final total = isExpense
          ? controller.totalExpense.value
          : controller.totalIncome.value;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            isExpense ? 'Total Pengeluaran' : 'Total Pemasukan',
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: Color(0xFF4B5563),
            ),
          ),

          const SizedBox(height: 5),

          Text(
            controller.formatCurrency(total),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: AppColors.text,
            ),
          ),

          const SizedBox(height: 4),

          Row(
            children: [
              const Icon(
                Icons.arrow_upward_rounded,
                size: 11,
                color: Color(0xFFE85C5C),
              ),

              const SizedBox(width: 2),

              Text(
                isExpense ? '12% dari April' : '8% dari April',
                style: const TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFE85C5C),
                ),
              ),
            ],
          ),
        ],
      );
    });
  }
}
