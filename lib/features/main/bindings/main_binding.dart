import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:saku_kita_app/features/account/bindings/account_binding.dart';
import 'package:saku_kita_app/features/budget/bindings/budget_bindind.dart';
import 'package:saku_kita_app/features/dashboard/bindings/dashboard_binding.dart';
import 'package:saku_kita_app/features/main/controllers/main_controller.dart';
import 'package:saku_kita_app/features/transaction/bindings/transaction_binding.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());

    DashboardBinding().dependencies();
    TransactionBinding().dependencies();
    BudgetBinding().dependencies();
    AccountBinding().dependencies();
  }
}
