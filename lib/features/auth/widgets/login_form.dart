import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_input.dart';
import '../../../core/widgets/social_button.dart';
import '../controllers/login_controller.dart';

class LoginForm extends GetView<LoginController> {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppInput(
          label: 'Email atau nomor HP',
          hintText: 'Masukkan email atau nomor HP',
          controller: controller.emailController,
          prefixIcon: Icons.person_outline_rounded,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
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
          ),
        ),

        const SizedBox(height: 12),

        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: controller.forgotPassword,
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
                onPressed: controller.loginWithGoogle,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: SocialButton(
                icon: Icons.apple,
                label: 'Apple',
                onPressed: controller.loginWithApple,
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
