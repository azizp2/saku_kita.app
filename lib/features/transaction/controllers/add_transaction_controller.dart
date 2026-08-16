import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTransactionController extends GetxController {
  final selectedType = 0.obs;

  final amountController = TextEditingController();
  final noteController = TextEditingController();

  final selectedCategory = RxnString();
  final selectedWallet = RxnString();
  final selectedDate = DateTime.now().obs;

  final categories = const [
    'Makan & Minum',
    'Transportasi',
    'Belanja',
    'Hiburan',
    'Tagihan',
    'Kesehatan',
    'Lainnya',
  ];

  final wallets = const ['Wallet Utama', 'Tabungan Bersama', 'Dana Darurat'];

  final List<Map<String, dynamic>> quickTransactions = const [
    {
      'title': 'Gaji',
      'icon': Icons.account_balance_wallet_rounded,
      'color': Color(0xFF35A981),
    },
    {
      'title': 'Belanja Bulanan',
      'icon': Icons.shopping_basket_rounded,
      'color': Color(0xFFFF9F43),
    },
    {
      'title': 'Bensin',
      'icon': Icons.local_gas_station_rounded,
      'color': Color(0xFF438AC0),
    },
    {
      'title': 'Internet',
      'icon': Icons.wifi_rounded,
      'color': Color(0xFF32A48D),
    },
    {'title': 'Lainnya', 'icon': Icons.add_rounded, 'color': Color(0xFF35A981)},
  ];

  void changeType(int index) {
    selectedType.value = index;
  }

  void selectCategory() {
    Get.bottomSheet(
      _SelectionSheet(
        title: 'Pilih Kategori',
        items: categories,
        onSelected: (value) {
          selectedCategory.value = value;
          Get.back();
        },
      ),
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    );
  }

  void selectWallet() {
    Get.bottomSheet(
      _SelectionSheet(
        title: 'Pilih Wallet',
        items: wallets,
        onSelected: (value) {
          selectedWallet.value = value;
          Get.back();
        },
      ),
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    );
  }

  Future<void> selectDate() async {
    final result = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate.value,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (result != null) {
      selectedDate.value = result;
    }
  }

  void selectQuickTransaction(Map<String, dynamic> transaction) {
    final title = transaction['title'] as String;

    switch (title) {
      case 'Gaji':
        selectedType.value = 0;
        selectedCategory.value = 'Pemasukan';
        break;

      case 'Belanja Bulanan':
        selectedType.value = 1;
        selectedCategory.value = 'Belanja';
        break;

      case 'Bensin':
        selectedType.value = 1;
        selectedCategory.value = 'Transportasi';
        break;

      case 'Internet':
        selectedType.value = 1;
        selectedCategory.value = 'Tagihan';
        break;

      default:
        break;
    }
  }

  void saveTransaction() {
    if (amountController.text.trim().isEmpty) {
      Get.snackbar(
        'Jumlah belum diisi',
        'Silakan masukkan jumlah transaksi.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    if (selectedCategory.value == null) {
      Get.snackbar(
        'Kategori belum dipilih',
        'Silakan pilih kategori transaksi.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    if (selectedWallet.value == null) {
      Get.snackbar(
        'Wallet belum dipilih',
        'Silakan pilih wallet.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // TODO:
    // Kirim data ke API

    Get.back();

    Get.snackbar(
      'Berhasil',
      'Transaksi berhasil disimpan.',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  @override
  void onClose() {
    amountController.dispose();
    noteController.dispose();

    super.onClose();
  }
}

class _SelectionSheet extends StatelessWidget {
  final String title;
  final List<String> items;
  final Function(String) onSelected;

  const _SelectionSheet({
    required this.title,
    required this.items,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),

            const SizedBox(height: 16),

            ...items.map(
              (item) => ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(item),
                trailing: const Icon(Icons.chevron_right_rounded),
                onTap: () => onSelected(item),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
