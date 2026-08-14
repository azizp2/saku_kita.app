import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final obscurePassword = true.obs;
  final isLoading = false.obs;

  final nameError = RxnString();
  final emailError = RxnString();
  final passwordError = RxnString();
  final confirmPasswordError = RxnString();

  void togglePassword() {
    obscurePassword.value = !obscurePassword.value;
  }

  @override
  void onInit() {
    super.onInit();

    nameController.addListener(() {
      if (nameError.value != null) {
        nameError.value = null;
      }
    });

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

    confirmPasswordController.addListener(() {
      if (confirmPasswordError.value != null) {
        confirmPasswordError.value = null;
      }
    });
  }

  Future<void> register() async {
    try {
      if (!validatedRegister()) {
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

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.onClose();
  }

  bool validatedRegister() {
    bool isValid = true;

    // Name
    if (nameController.text.trim().isEmpty) {
      nameError.value = 'Fullname wajib diisi';
      isValid = false;
    } else {
      nameError.value = null;
    }

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

    if (confirmPasswordController.text.isEmpty) {
      confirmPasswordError.value = 'Konfirmasi kata sandi wajib diisi';
      isValid = false;
    } else if (confirmPasswordController.text.trim() !=
        passwordController.text.trim()) {
      confirmPasswordError.value =
          'Konfirmasi password tidak match dengna password';
      isValid = false;
    }

    return isValid;
  }
}
