import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FinancialGoalModel {
  final String title;
  final double collected;
  final double target;
  final DateTime targetDate;
  final IconData icon;
  final Color color;

  const FinancialGoalModel({
    required this.title,
    required this.collected,
    required this.target,
    required this.targetDate,
    required this.icon,
    required this.color,
  });

  double get progress {
    if (target <= 0) return 0;

    return (collected / target).clamp(0.0, 1.0);
  }

  int get percentage {
    return (progress * 100).round();
  }
}

class FinancialGoalController extends GetxController {
  final selectedTab = 0.obs;

  final goals = <FinancialGoalModel>[
    FinancialGoalModel(
      title: 'Liburan ke Bali',
      collected: 2_500_000,
      target: 5_000_000,
      targetDate: DateTime(2025, 12, 30),
      icon: Icons.beach_access_rounded,
      color: Color(0xFF35A981),
    ),
    FinancialGoalModel(
      title: 'DP Rumah',
      collected: 25_000_000,
      target: 100_000_000,
      targetDate: DateTime(2026, 12, 31),
      icon: Icons.home_rounded,
      color: Color(0xFFE47B4F),
    ),
    FinancialGoalModel(
      title: 'Pendidikan Anak',
      collected: 5_000_000,
      target: 50_000_000,
      targetDate: DateTime(2030, 12, 31),
      icon: Icons.school_rounded,
      color: Color(0xFF374151),
    ),
  ].obs;

  final completedGoals = <FinancialGoalModel>[].obs;

  void changeTab(int index) {
    selectedTab.value = index;
  }

  double get totalCollected {
    return goals.fold(0, (sum, goal) => sum + goal.collected);
  }

  void addGoal() {
    Get.snackbar(
      'Tujuan Keuangan',
      'Form tujuan keuangan akan dibuka.',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void openGoal(FinancialGoalModel goal) {
    Get.snackbar(
      goal.title,
      '${formatCurrency(goal.collected)} / ${formatCurrency(goal.target)}',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  String formatCurrency(double value) {
    final formatted = value
        .toStringAsFixed(0)
        .replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (match) => '.');

    return 'Rp $formatted';
  }

  String formatDate(DateTime date) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'Mei',
      'Jun',
      'Jul',
      'Agu',
      'Sep',
      'Okt',
      'Nov',
      'Des',
    ];

    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }
}
