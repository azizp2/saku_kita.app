import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saku_kita_app/app/routes/app_routes.dart';
import 'package:saku_kita_app/core/storage/secure_storage.dart';
import 'package:saku_kita_app/features/auth/repositories/auth_repository.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final obscurePassword = true.obs;
  final isLoading = false.obs;

  final emailError = RxnString();
  final passwordError = RxnString();

  final AuthRepository authRepository;
  final SecureStorage secureStorage;

  LoginController({required this.authRepository, required this.secureStorage});

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

  Future<void> login() async {
    try {
      if (!validatedLogin()) {
        return;
      }
      isLoading.value = true;

      final result = await authRepository.login(
        email: emailController.text.trim(),
        password: passwordController.text,
      );

      await secureStorage.saveTokens(
        accessToken: result.accessToken.accessToken,
        refreshToken: result.accessToken.refreshToken,
        expiresIn: result.accessToken.expiresIn,
      );



      Get.snackbar(
        'Login',
        'Login berhasil.',
        snackPosition: SnackPosition.BOTTOM,
      );

      Get.offAllNamed(AppRoutes.home);
    } catch (e) {
      Get.snackbar(
        'Login gagal',
        e.toString().replaceFirst('Exception: ', ''),
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
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
      emailError.value = 'Username wajib diisi';
      isValid = false;
    } else {
      emailError.value = null;
    }

    // Password
    if (passwordController.text.isEmpty) {
      passwordError.value = 'Kata sandi wajib diisi';
      isValid = false;
    } else {
      passwordError.value = null;
    }

    return isValid;
  }
}
