import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saku_kita_app/app/routes/app_routes.dart';
import 'package:saku_kita_app/features/auth/controllers/register_controller.dart';

import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_input.dart';

class RegisterForm extends GetView<RegisterController> {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => AppInput(
            label: 'Name Lengkap',
            hintText: 'Masukkan nama lengkap',
            controller: controller.nameController,
            prefixIcon: Icons.person_outline_rounded,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            errorText: controller.nameError.value,
          ),
        ),

        const SizedBox(height: 16),
        Obx(
          () => AppInput(
            label: 'Email',
            hintText: 'Masukkan email',
            controller: controller.emailController,
            prefixIcon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            errorText: controller.emailError.value,
          ),
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
            errorText: controller.passwordError.value,
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
            controller: controller.confirmPasswordController,
            prefixIcon: Icons.lock_outline_rounded,
            obscureText: controller.obscurePassword.value,
            textInputAction: TextInputAction.done,
            onSubmitted: (_) => controller.register(),
            errorText: controller.confirmPasswordError.value,
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
            text: 'Daftar',
            loading: controller.isLoading.value,
            onPressed: () => Get.toNamed(AppRoutes.otp),
          ),
        ),
      ],
    );
  }
}
