import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_input.dart';
import '../controllers/login_controller.dart';

class ForgotPasswordForm extends GetView<LoginController> {
  const ForgotPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        AppInput(
          label: 'Email atau nomor HP',
          hintText: 'Masukkan email atau nomor HP.',
          controller: controller.emailController,
          prefixIcon: Icons.email,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
        ),

        const SizedBox(height: 120),

        Obx(
          () => AppButton(
            text: 'Masuk',
            loading: controller.isLoading.value,
            onPressed: controller.login,
          ),
        ),
      ],
    );
  }
}
