import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saku_kita_app/features/auth/controllers/register_controller.dart';

import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_input.dart';

class RegisterForm extends GetView<RegisterController> {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppInput(
          label: 'Name Lengkap',
          hintText: 'Masukkan nama lengkap',
          controller: controller.emailController,
          prefixIcon: Icons.person_outline_rounded,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
        ),

        const SizedBox(height: 16),

        AppInput(
          label: 'Email',
          hintText: 'Masukkan email',
          controller: controller.emailController,
          prefixIcon: Icons.person_outline_rounded,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
        ),

        const SizedBox(height: 16),

        Obx(
          () => AppInput(
            label: 'Kata sandi',
            hintText: 'Masukkan kata sandi',
            controller: controller.passwordController,
            prefixIcon: Icons.lock_outline_rounded,
            obscureText: controller.obscurePassword.value,
            textInputAction: TextInputAction.done,
            onSubmitted: (_) => controller.register(),
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

        const SizedBox(height: 16),
        Obx(
          () => AppInput(
            label: 'Konfirmasi Kata sandi',
            hintText: 'Masukkan ulang kata sandi',
            controller: controller.passwordController,
            prefixIcon: Icons.lock_outline_rounded,
            obscureText: controller.obscurePassword.value,
            textInputAction: TextInputAction.done,
            onSubmitted: (_) => controller.register(),
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

        const SizedBox(height: 16),

        Obx(
          () => AppButton(
            text: 'Masuk',
            loading: controller.isLoading.value,
            onPressed: controller.register,
          ),
        ),
      ],
    );
  }
}
