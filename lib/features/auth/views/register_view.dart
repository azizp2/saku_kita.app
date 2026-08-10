import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saku_kita_app/features/auth/widgets/register_form.dart';

import '../../../app/theme/app_colors.dart';
import '../widgets/auth_header.dart';
import '../widgets/auth_logo.dart';
import '../widgets/login_form.dart';
import '../controllers/login_controller.dart';

class RegisterView extends GetView<LoginController> {
  const RegisterView({super.key});

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
                  title: 'Buat Akun Baru',
                  subTitle: "Buat akun untuk memulai penggunaan saku.kita",
                ),

                const SizedBox(height: 28),

                const AuthLogo(imagePath: 'assets/images/undraw_add-user.png'),

                const SizedBox(height: 40),

                const RegisterForm(),

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
          'Sudah punya akun? ',
          style: TextStyle(color: AppColors.muted, fontSize: 14),
        ),
        GestureDetector(
          onTap: controller.goToLogin,
          child: const Text(
            'Login',
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
