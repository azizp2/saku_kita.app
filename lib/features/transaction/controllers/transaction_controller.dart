import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController {
  final selectedFilter = 0.obs;

  final filters = const ['Semua', 'Pemasukan', 'Pengeluaran'];

  final transactions = <Map<String, dynamic>>[
    {
      'date': 'Hari ini',
      'title': 'Makan siang',
      'category': 'Kategori Makan & Minum',
      'amount': '-Rp 45.000',
      'time': '12:30',
      'isIncome': false,
      'icon': Icons.restaurant_rounded,
      'color': Color(0xFFF3A62F),
    },
    {
      'date': 'Hari ini',
      'title': 'Gaji Bulanan',
      'category': 'Kategori Pemasukan',
      'amount': '+Rp 8.000.000',
      'time': '09:00',
      'isIncome': true,
      'icon': Icons.account_balance_wallet_rounded,
      'color': Color(0xFF36A982),
    },
    {
      'date': 'Kemarin',
      'title': 'Belanja Bulanan',
      'category': 'Kategori Belanja',
      'amount': '-Rp 350.000',
      'time': '20:15',
      'isIncome': false,
      'icon': Icons.shopping_bag_rounded,
      'color': Color(0xFFE85C5C),
    },
    {
      'date': 'Kemarin',
      'title': 'Bensin',
      'category': 'Kategori Transportasi',
      'amount': '-Rp 50.000',
      'time': '16:30',
      'isIncome': false,
      'icon': Icons.local_gas_station_rounded,
      'color': Color(0xFFE8794F),
    },
    {
      'date': '24 Mei 2025',
      'title': 'Nonton Bioskop',
      'category': 'Kategori Hiburan',
      'amount': '-Rp 120.000',
      'time': '21:00',
      'isIncome': false,
      'icon': Icons.movie_rounded,
      'color': Color(0xFF4E91C7),
    },
    {
      'date': '24 Mei 2025',
      'title': 'Transfer dari Tabungan',
      'category': 'Kategori Transfer',
      'amount': '+Rp 500.000',
      'time': '10:45',
      'isIncome': true,
      'icon': Icons.sync_alt_rounded,
      'color': Color(0xFF3A9B98),
    },
  ].obs;

  void changeFilter(int index) {
    selectedFilter.value = index;
  }

  List<Map<String, dynamic>> get filteredTransactions {
    if (selectedFilter.value == 0) {
      return transactions;
    }

    final isIncome = selectedFilter.value == 1;

    return transactions
        .where((transaction) => transaction['isIncome'] == isIncome)
        .toList();
  }

  void searchTransaction() {
    Get.snackbar(
      'Pencarian',
      'Fitur pencarian transaksi.',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void openFilter() {
    Get.snackbar(
      'Filter',
      'Filter transaksi.',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void openTransaction(Map<String, dynamic> transaction) {
    Get.snackbar(
      transaction['title'],
      transaction['amount'],
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
