import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpenseCategoryModel {
  final String name;
  final double amount;
  final double percentage;
  final Color color;
  final IconData icon;

  const ExpenseCategoryModel({
    required this.name,
    required this.amount,
    required this.percentage,
    required this.color,
    required this.icon,
  });
}

class ReportController extends GetxController {
  final selectedType = 0.obs;

  final selectedMonth = DateTime(2025, 5, 1).obs;

  final totalExpense = 6_300_000.0.obs;
  final totalIncome = 18_750_000.0.obs;

  final expenseCategories = <ExpenseCategoryModel>[
    ExpenseCategoryModel(
      name: 'Makan & Minum',
      amount: 2_100_000,
      percentage: 33,
      color: Color(0xFF438AC0),
      icon: Icons.restaurant_rounded,
    ),
    ExpenseCategoryModel(
      name: 'Transportasi',
      amount: 1_300_000,
      percentage: 21,
      color: Color(0xFFFFA726),
      icon: Icons.directions_car_rounded,
    ),
    ExpenseCategoryModel(
      name: 'Belanja',
      amount: 1_200_000,
      percentage: 19,
      color: Color(0xFFE66A45),
      icon: Icons.shopping_basket_rounded,
    ),
    ExpenseCategoryModel(
      name: 'Hiburan',
      amount: 960_000,
      percentage: 15,
      color: Color(0xFF7D8790),
      icon: Icons.movie_rounded,
    ),
    ExpenseCategoryModel(
      name: 'Lainnya',
      amount: 740_000,
      percentage: 12,
      color: Color(0xFFB0B7BD),
      icon: Icons.more_horiz_rounded,
    ),
  ].obs;

  // Data grafik harian.
  final expenseChartData = const [
    120000.0,
    150000.0,
    140000.0,
    200000.0,
    220000.0,
    300000.0,
    450000.0,
    440000.0,
    445000.0,
    450000.0,
    600000.0,
    700000.0,
    650000.0,
    670000.0,
    730000.0,
  ];

  void changeType(int index) {
    selectedType.value = index;
  }

  void previousMonth() {
    final current = selectedMonth.value;

    selectedMonth.value = DateTime(current.year, current.month - 1, 1);

    _loadReport();
  }

  void nextMonth() {
    final current = selectedMonth.value;

    selectedMonth.value = DateTime(current.year, current.month + 1, 1);

    _loadReport();
  }

  void _loadReport() {
    // TODO:
    // Nanti ambil data berdasarkan:
    //
    // selectedMonth.value
    // selectedType.value
    //
    // dari API / repository.
  }

  String get monthLabel {
    const months = [
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember',
    ];

    return '${months[selectedMonth.value.month - 1]} '
        '${selectedMonth.value.year}';
  }

  String formatCurrency(double value) {
    final formatted = value
        .toStringAsFixed(0)
        .replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (match) => '.');

    return 'Rp $formatted';
  }

  String formatShortCurrency(double value) {
    if (value >= 1_000_000) {
      return '${(value / 1_000_000).toStringAsFixed(1)}jt';
    }

    if (value >= 1_000) {
      return '${(value / 1_000).toStringAsFixed(0)}rb';
    }

    return value.toStringAsFixed(0);
  }
}
