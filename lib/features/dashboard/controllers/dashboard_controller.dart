import 'package:get/get.dart';

class DashboardController extends GetxController {
  final currentIndex = 0.obs;

  void changeTab(int index) {
    currentIndex.value = index;
  }

  void addTransaction() {
    Get.snackbar(
      'Tambah Transaksi',
      'Form transaksi akan dibuka.',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void showNotifications() {
    Get.snackbar(
      'Notifikasi',
      'Belum ada notifikasi baru.',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void showProfile() {
    Get.snackbar(
      'Akun',
      'Halaman akun akan dibuka.',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
