import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:saku_kita_app/features/budget/controllers/budget_controller.dart';

class BudgetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BudgetController>(() => BudgetController());
  }
}
