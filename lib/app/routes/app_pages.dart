import 'package:get/get.dart';
import 'package:saku_kita_app/features/account/bindings/account_binding.dart';
import 'package:saku_kita_app/features/account/pages/account_page.dart';
import 'package:saku_kita_app/features/auth/bindings/auth_session_binding.dart';
import 'package:saku_kita_app/features/auth/bindings/otp_binding.dart';
import 'package:saku_kita_app/features/auth/bindings/register_binding.dart';
import 'package:saku_kita_app/features/auth/pages/forgot_password_page.dart';
import 'package:saku_kita_app/features/auth/pages/otp_page.dart';
import 'package:saku_kita_app/features/auth/pages/splash_page.dart';
import 'package:saku_kita_app/features/budget/bindings/budget_bindind.dart';
import 'package:saku_kita_app/features/budget/pages/budget_page.dart';
import 'package:saku_kita_app/features/dashboard/bindings/dashboard_binding.dart';
import 'package:saku_kita_app/features/dashboard/pages/dashboard_page.dart';
import 'package:saku_kita_app/features/financial_goal/bindings/financial_goal_binding.dart';
import 'package:saku_kita_app/features/financial_goal/pages/financial_goal_page.dart';
import 'package:saku_kita_app/features/financial_goal/widgets/financial_goal_card.dart';
import 'package:saku_kita_app/features/home/page/HomePage.dart';
import 'package:saku_kita_app/features/report/bindings/report_binding.dart';
import 'package:saku_kita_app/features/report/pages/report_page.dart';
import 'package:saku_kita_app/features/transaction/bindings/add_transaction_binding.dart';
import 'package:saku_kita_app/features/transaction/bindings/transaction_binding.dart';
import 'package:saku_kita_app/features/transaction/pages/add_transaction_page.dart';
import 'package:saku_kita_app/features/transaction/pages/transaction_page.dart';
import 'package:saku_kita_app/features/wallets/bindings/wallet_binding.dart';
import 'package:saku_kita_app/features/wallets/pages/wallet_page.dart';

import '../../features/auth/bindings/login_binding.dart';
import '../../features/auth/pages/login_page.dart';
import '../../features/auth/pages/register_page.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.dashboard,
      page: () => const DashboardPage(),
      binding: DashboardBinding(),
    ),

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
      name: AppRoutes.otp,
      page: () => const OtpPage(),
      binding: OtpBinding(),
    ),

    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashPage(),
      binding: AuthSessionBinding(),
    ),

    GetPage(
      name: AppRoutes.wallet,
      page: () => const WalletPage(),
      binding: WalletBinding(),
    ),

    GetPage(
      name: AppRoutes.transaction,
      page: () => const TransactionPage(),
      binding: TransactionBinding(),
    ),

    GetPage(
      name: AppRoutes.addTransaction,
      page: () => const AddTransactionPage(),
      binding: AddTransactionBinding(),
    ),

    GetPage(
      name: AppRoutes.budget,
      page: () => const BudgetPage(),
      binding: BudgetBinding(),
    ),

    GetPage(
      name: AppRoutes.financialGoal,
      page: () => const FinancialGoalPage(),
      binding: FinancialGoalBinding(),
    ),

    GetPage(
      name: AppRoutes.report,
      page: () => const ReportPage(),
      binding: ReportBinding(),
    ),

    GetPage(
      name: AppRoutes.account,
      page: () => const AccountPage(),
      binding: AccountBinding(),
    ),

    GetPage(name: AppRoutes.home, page: () => Homepage()),

    // GetPage(
    //   name: AppRoutes.forgotPassword,
    //   page: () => const ForgotPasswordView(),
    //   binding: AuthBinding(),
    // ),
  ];
}
