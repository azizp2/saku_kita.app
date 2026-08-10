import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saku_kita_app/app/routes/app_routes.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final obscurePassword = true.obs;
  final isLoading = false.obs;

  void togglePassword() {
    obscurePassword.value = !obscurePassword.value;
  }

  void goToLogin() {
    Get.toNamed(AppRoutes.login);
  }

  Future<void> login() async {
    if (emailController.text.trim().isEmpty) {
      Get.snackbar(
        'Login',
        'Email atau nomor HP wajib diisi',
        snackPosition: SnackPosition.BOTTOM,
      );

      return;
    }

    if (passwordController.text.isEmpty) {
      Get.snackbar(
        'Login',
        'Kata sandi wajib diisi',
        snackPosition: SnackPosition.BOTTOM,
      );

      return;
    }

    try {
      isLoading.value = true;

      if (emailController.text == "admin" &&
          passwordController.text == "admin") {
        Get.snackbar(
          "Succcess",
          "Login successfully.",
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }

      // TODO:
      // AuthRepository
      // ↓
      // Dio
      // ↓
      // SakuKita.Api

      await Future.delayed(const Duration(seconds: 1));

      Get.snackbar(
        'Login',
        'Credentials failed.',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void forgotPassword() {
    Get.toNamed(AppRoutes.register);
  }

  void register() {
    Get.toNamed(AppRoutes.register);
  }

  void loginWithGoogle() {
    // TODO
  }

  void loginWithApple() {
    // TODO
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();

    super.onClose();
  }
}
