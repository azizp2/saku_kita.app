import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saku_kita_app/app/routes/app_routes.dart';
import 'package:saku_kita_app/features/auth/widgets/forgot_password_form.dart';

import '../../../app/theme/app_colors.dart';
import '../widgets/auth_logo.dart';
import '../controllers/login_controller.dart';

class ForgotPasswordView extends GetView<LoginController> {
  const ForgotPasswordView({super.key});

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

                const AuthLogo(
                  imagePath: 'assets/images/undraw_online-security.png',
                ),
                const SizedBox(height: 28),
                Column(
                  children: [
                    Text(
                      "Lupa Kata Sandi ?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        color: AppColors.text,
                      ),
                    ),
                    SizedBox(height: 12),
                    SizedBox(
                      width: 260,
                      child: Text(
                        'Masukkan email atau nomor HP yang terdaftar, '
                        'kami akan mengirimkan link untuk mereset kata sandi.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF6B7280),
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                const ForgotPasswordForm(),

                const SizedBox(height: 100),

                _FooterSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FooterSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 23),
          child: GestureDetector(
            onTap: () => Get.toNamed(AppRoutes.login),
            child: const Text(
              'Kembali ke halaman masuk',
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
