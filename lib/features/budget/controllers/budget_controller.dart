import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BudgetCategoryModel {
  final String name;
  final double used;
  final double limit;
  final IconData icon;
  final Color color;

  const BudgetCategoryModel({
    required this.name,
    required this.used,
    required this.limit,
    required this.icon,
    required this.color,
  });

  double get progress {
    if (limit <= 0) return 0;

    return (used / limit).clamp(0.0, 1.0);
  }

  int get percentage {
    return (progress * 100).round();
  }
}

class BudgetController extends GetxController {
  final totalBudget = 10_000_000.0.obs;
  final totalUsed = 6_300_000.0.obs;

  final budgetCategories = <BudgetCategoryModel>[
    BudgetCategoryModel(
      name: 'Makan & Minum',
      used: 2_100_000,
      limit: 3_000_000,
      icon: Icons.restaurant_rounded,
      color: Color(0xFFFF9F43),
    ),
    BudgetCategoryModel(
      name: 'Transportasi',
      used: 1_350_000,
      limit: 2_000_000,
      icon: Icons.directions_car_rounded,
      color: Color(0xFF438AC0),
    ),
    BudgetCategoryModel(
      name: 'Belanja',
      used: 1_200_000,
      limit: 2_500_000,
      icon: Icons.shopping_basket_rounded,
      color: Color(0xFFE85C5C),
    ),
    BudgetCategoryModel(
      name: 'Hiburan',
      used: 850_000,
      limit: 1_500_000,
      icon: Icons.movie_rounded,
      color: Color(0xFF8B6B3F),
    ),
    BudgetCategoryModel(
      name: 'Lainnya',
      used: 800_000,
      limit: 1_000_000,
      icon: Icons.more_horiz_rounded,
      color: Color(0xFF9CA3AF),
    ),
  ].obs;

  double get totalProgress {
    if (totalBudget.value <= 0) return 0;

    return (totalUsed.value / totalBudget.value).clamp(0.0, 1.0);
  }

  int get totalPercentage {
    return (totalProgress * 100).round();
  }

  String formatCurrency(double value) {
    final formatted = value
        .toStringAsFixed(0)
        .replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (match) => '.');

    return 'Rp $formatted';
  }

  void addBudget() {
    Get.snackbar(
      'Tambah Budget',
      'Form tambah budget akan dibuka.',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void openCategory(BudgetCategoryModel category) {
    Get.snackbar(
      category.name,
      '${formatCurrency(category.used)} / ${formatCurrency(category.limit)}',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
