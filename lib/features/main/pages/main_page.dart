import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saku_kita_app/core/widgets/app_bottom_navigation.dart';
import 'package:saku_kita_app/core/widgets/app_floating_action_button.dart';

import '../controllers/main_controller.dart';
import '../../dashboard/pages/dashboard_page.dart';
import '../../transaction/pages/transaction_page.dart';
import '../../budget/pages/budget_page.dart';
import '../../account/pages/account_page.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});

  static const pages = [
    DashboardPage(),
    TransactionPage(),
    BudgetPage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: IndexedStack(
          index: controller.currentIndex.value,
          children: pages,
        ),

        bottomNavigationBar: AppBottomNavigation(
          currentIndex: controller.currentIndex.value,
          onChanged: controller.changeTab,
        ),
        floatingActionButton: AppFloatingActionButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
