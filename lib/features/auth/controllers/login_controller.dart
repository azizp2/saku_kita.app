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

      if (!result.success || result.data == null) {
        final message = result.errors.isNotEmpty
            ? result.errors.first.message
            : "login gagal";

        throw Exception(message);
      }

      final loginData = result.data;

      await secureStorage.saveTokens(
        accessToken: loginData!.accessToken.accessToken,
        refreshToken: loginData.accessToken.refreshToken,
        expiresIn: loginData.accessToken.expiresIn,
      );

      Get.snackbar(
        'Login',
        'Credentials failed.',
        snackPosition: SnackPosition.BOTTOM,
      );

      Get.offAllNamed(AppRoutes.forgotPassword);
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
