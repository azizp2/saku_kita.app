import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../features/auth/bindings/auth_binding.dart';
import '../features/auth/views/login_view.dart';
import 'theme/app_theme.dart';

class SakuKitaApp extends StatelessWidget {
  const SakuKitaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Saku.Kita',
      theme: AppTheme.light,
      initialBinding: AuthBinding(),
      home: const LoginView(),
    );
  }
}
