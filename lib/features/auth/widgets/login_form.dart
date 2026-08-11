import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saku_kita_app/app/routes/app_routes.dart';
import 'package:saku_kita_app/features/auth/controllers/login_controller.dart';

import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_input.dart';
import '../../../core/widgets/social_button.dart';

class LoginForm extends GetView<LoginController> {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => AppInput(
            label: 'Email atau nomor HP',
            hintText: 'Masukkan email atau nomor HP',
            controller: controller.emailController,
            prefixIcon: Icons.person_outline_rounded,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            errorText: controller.emailError.value,
          ),
        ),

        const SizedBox(height: 22),

        Obx(
          () => AppInput(
            label: 'Kata sandi',
            hintText: 'Masukkan kata sandi',
            controller: controller.passwordController,
            prefixIcon: Icons.lock_outline_rounded,
            obscureText: controller.obscurePassword.value,
            textInputAction: TextInputAction.done,
            onSubmitted: (_) => controller.login(),
            suffixIcon: IconButton(
              onPressed: controller.togglePassword,
              icon: Icon(
                controller.obscurePassword.value
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
              ),
            ),
            errorText: controller.passwordError.value,
          ),
        ),

        const SizedBox(height: 12),

        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () => Get.toNamed(AppRoutes.forgotPassword),
            child: const Text('Lupa kata sandi?'),
          ),
        ),

        const SizedBox(height: 16),

        Obx(
          () => AppButton(
            text: 'Masuk',
            loading: controller.isLoading.value,
            onPressed: controller.login,
          ),
        ),

        const SizedBox(height: 30),

        const _OrDivider(),

        const SizedBox(height: 20),

        Row(
          children: [
            Expanded(
              child: SocialButton(
                icon: Icons.g_mobiledata_rounded,
                label: 'Google',
                onPressed: () {},
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: SocialButton(
                icon: Icons.apple,
                label: 'Apple',
                onPressed: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _OrDivider extends StatelessWidget {
  const _OrDivider();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'atau masuk dengan',
            style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
          ),
        ),
        const Expanded(child: Divider()),
      ],
    );
  }
}
