import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'Selamat datang 👋',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w700,
            color: AppColors.text,
          ),
        ),

        SizedBox(height: 8),

        Text(
          'Masuk untuk melanjutkan ke Saku.Kita',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14, color: AppColors.muted),
        ),
      ],
    );
  }
}
