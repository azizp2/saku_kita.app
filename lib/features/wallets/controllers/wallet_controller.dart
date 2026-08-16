import 'package:get/get.dart';

class WalletController extends GetxController {
  final walletBalance = 'Rp 8.250.000'.obs;
  final sharedSaving = 'Rp 3.500.000'.obs;
  final emergencyFund = 'Rp 2.700.000'.obs;

  final financialGoals = <Map<String, dynamic>>[
    {
      'title': 'Liburan ke Bali',
      'current': 2500000.0,
      'target': 5000000.0,
      'icon': '🌴',
    },
    {
      'title': 'DP Rumah',
      'current': 25000000.0,
      'target': 100000000.0,
      'icon': '🏠',
    },
  ].obs;

  void addWallet() {
    Get.snackbar(
      'Tambah Wallet',
      'Form tambah wallet akan dibuka.',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void addFinancialGoal() {
    Get.snackbar(
      'Tujuan Keuangan',
      'Form tujuan keuangan akan dibuka.',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void openWallet(String walletName) {
    Get.snackbar(
      walletName,
      'Detail wallet akan dibuka.',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  String formatCurrency(double value) {
    final formatted = value
        .toStringAsFixed(0)
        .replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (match) => '.');

    return 'Rp $formatted';
  }

  int getPercentage(double current, double target) {
    if (target <= 0) return 0;

    return ((current / target) * 100).clamp(0, 100).round();
  }
}
