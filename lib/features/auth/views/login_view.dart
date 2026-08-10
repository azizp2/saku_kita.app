import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/theme/app_colors.dart';
import '../widgets/auth_header.dart';
import '../widgets/auth_logo.dart';
import '../widgets/login_form.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Column(
              children: [
                const SizedBox(height: 30),

                const AuthHeader(
                  title: 'Selamat datang 👋',
                  subTitle: "Silahkan login untuk melanjutkan.",
                ),

                const SizedBox(height: 28),

                const AuthLogo(
                  imagePath: 'assets/images/undraw_wallet_diag.png',
                ),

                const SizedBox(height: 40),

                const LoginForm(),

                const SizedBox(height: 36),

                _RegisterSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RegisterSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Belum punya akun? ',
          style: TextStyle(color: AppColors.muted, fontSize: 14),
        ),
        GestureDetector(
          onTap: controller.register,
          child: const Text(
            'Daftar',
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
