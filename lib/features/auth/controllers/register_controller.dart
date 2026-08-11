import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saku_kita_app/app/routes/app_routes.dart';

class RegisterController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final obscurePassword = true.obs;
  final isLoading = false.obs;

  final emailError = RxnString();
  final passwordError = RxnString();

  void togglePassword() {
    obscurePassword.value = !obscurePassword.value;
  }

  @override
  void onInit() {
    super.onInit();

    emailController.addListener(() {
      if (emailError.value != null) {
        emailError.value = null;
      }
    });

    passwordController.addListener(() {
      if (passwordError.value != null) {
        passwordError.value = null;
      }
    });
  }

  void goToLogin() {
    Get.toNamed(AppRoutes.login);
  }

  Future<void> register() async {
    // if (emailController.text.trim().isEmpty) {
    //   Get.snackbar(
    //     'Login',
    //     'Email atau nomor HP wajib diisi',
    //     snackPosition: SnackPosition.BOTTOM,
    //   );

    //   return;
    // }

    // if (passwordController.text.isEmpty) {
    //   Get.snackbar(
    //     'Login',
    //     'Kata sandi wajib diisi',
    //     snackPosition: SnackPosition.BOTTOM,
    //   );

    //   return;
    // }

    try {
      if (!validatedLogin()) {
        return;
      }
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
    Get.toNamed(AppRoutes.forgotPassword);
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

  bool validatedLogin() {
    bool isValid = true;

    // Email
    if (emailController.text.trim().isEmpty) {
      emailError.value = 'Email wajib diisi';
      isValid = false;
    } else if (!GetUtils.isEmail(emailController.text.trim())) {
      emailError.value = 'Format email tidak valid';
      isValid = false;
    } else {
      emailError.value = null;
    }

    // Password
    if (passwordController.text.isEmpty) {
      passwordError.value = 'Kata sandi wajib diisi';
      isValid = false;
    } else if (passwordController.text.length < 8) {
      passwordError.value = 'Kata sandi minimal 8 karakter';
      isValid = false;
    } else {
      passwordError.value = null;
    }

    return isValid;
  }
}
