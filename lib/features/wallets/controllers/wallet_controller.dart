import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saku_kita_app/core/utils/snackbar_helper.dart';
import 'package:saku_kita_app/features/wallets/models/wallet_request.dart';
import 'package:saku_kita_app/features/wallets/models/wallet_response.dart';
import 'package:saku_kita_app/features/wallets/repo/wallet_repo.dart';

class WalletController extends GetxController {
  final WalletRepo walletRepo;
  final nameController = TextEditingController();
  final RxBool isLoading = false.obs;
  final RxList<WalletResponse> wallets = <WalletResponse>[].obs;
  final formKey = GlobalKey<FormState>();
  WalletResponse? editingWallet;

  WalletController({required this.walletRepo});

  @override
  Future<void> onReady() async {
    super.onReady();
    await fetchWallets();
  }

  @override
  void onClose() {
    nameController.dispose();
    super.onClose();
  }

  WalletResponse? get mainWallet {
    final result = wallets.where((wallet) => wallet.isMainWallet == true);
    return result.isNotEmpty ? result.first : null;
  }

  List<WalletResponse> get otherWallets {
    return wallets.where((wallet) => wallet.isMainWallet != true).toList();
  }

  Future<void> setMainWallet(String walletId) async {
    isLoading.value = true;
    try {
      await walletRepo.setMainWallet(walletId);
      await fetchWallets();

      SnackbarHelper.showSuccess(message: "Berhasil set default wallet");
    } catch (e) {
      SnackbarHelper.showError(
        message: e.toString().replaceFirst('Exception: ', ''),
      );
    } finally {
      isLoading.value = false;
    }
  }

  void openWallet(String walletId) {
    final wallet = wallets.firstWhere((wallet) => wallet.id == walletId);
    // HAPUS: Get.snackbar
    print('Open wallet: ${wallet.name}');
  }

  void addWallet() {
    // HAPUS: Get.snackbar
    print('Add wallet');
  }

  void setEditWallet(WalletResponse wallet) {
    editingWallet = wallet;
    nameController.text = wallet.name;
  }

  void resetForm() {
    nameController.clear();
    editingWallet = null;
  }

  Future<void> delete(String id) async {
    isLoading.value = true;

    try {
      await walletRepo.remote.delete(id);
      Get.back();
      SnackbarHelper.showSuccess(message: "Data berhasil dihapus.");
    } catch (e) {
      SnackbarHelper.showError(
        message: e.toString().replaceFirst('Exception: ', ''),
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchWallets() async {
    isLoading.value = true;
    try {
      final result = await walletRepo.getList();
      if (result != null) {
        wallets.assignAll(result);
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString().replaceFirst('Exception: ', ''),
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> submitForm() async {
    if (!formKey.currentState!.validate()) return;

    isLoading.value = true;

    try {
      final request = WalletRequest(name: nameController.text.trim());

      final result = editingWallet != null
          ? await walletRepo.update(editingWallet!.id, request)
          : await walletRepo.create(request);

      if (result) {
        await fetchWallets();
      }

      resetForm();
      Get.back();

      SnackbarHelper.showSuccess(
        title: "Sukses",
        message:
            'Wallet berhasil ${editingWallet == null ? 'ditambahkan' : 'diupdate'}',
      );
    } catch (e) {
      SnackbarHelper.showError(
        title: 'Error',
        message: e.toString().replaceFirst('Exception: ', ''),
      );
    } finally {
      isLoading.value = false;
    }
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
