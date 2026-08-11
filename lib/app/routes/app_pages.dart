import 'package:get/get.dart';
import 'package:saku_kita_app/features/auth/views/forgot_password_view.dart';
import 'package:saku_kita_app/features/auth/widgets/forgot_password_form.dart';

import '../../features/auth/bindings/auth_binding.dart';
import '../../features/auth/views/login_view.dart';
import '../../features/auth/views/register_view.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView(),
      binding: AuthBinding(),
    ),

    GetPage(
      name: AppRoutes.register,
      page: () => const RegisterView(),
      binding: AuthBinding(),
    ),

    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => const ForgotPasswordView(),
      binding: AuthBinding(),
    ),

    // GetPage(
    //   name: AppRoutes.forgotPassword,
    //   page: () => const ForgotPasswordView(),
    //   binding: AuthBinding(),
    // ),
  ];
}
