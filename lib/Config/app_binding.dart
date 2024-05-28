import 'package:flutter_starter/Features/Item/Controllers/item_controller.dart';
import 'package:get/get.dart';

import '../Features/Auth/Controllers/auth_controller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController());
    Get.put<ItemController>(ItemController());
    // Get.put<CourtController>(CourtController());
    // Get.put<EmployeeController>(EmployeeController());
  }
}
