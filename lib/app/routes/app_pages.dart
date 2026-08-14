import 'package:get/get.dart';
import 'package:saku_kita_app/features/auth/bindings/auth_session_binding.dart';
import 'package:saku_kita_app/features/auth/bindings/register_binding.dart';
import 'package:saku_kita_app/features/auth/pages/forgot_password_page.dart';
import 'package:saku_kita_app/features/auth/pages/splash_page.dart';
import 'package:saku_kita_app/features/home/page/HomePage.dart';

import '../../features/auth/bindings/login_binding.dart';
import '../../features/auth/pages/login_page.dart';
import '../../features/auth/pages/register_page.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),

    GetPage(
      name: AppRoutes.register,
      page: () => const RegisterPage(),
      binding: RegisterBinding(),
    ),

    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => const ForgotPasswordView(),
      binding: LoginBinding(),
    ),

    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashPage(),
      binding: AuthSessionBinding(),
    ),

    GetPage(name: AppRoutes.home, page: () => Homepage()),

    // GetPage(
    //   name: AppRoutes.forgotPassword,
    //   page: () => const ForgotPasswordView(),
    //   binding: AuthBinding(),
    // ),
  ];
}
