import 'package:get/get.dart';

import '../Features/Auth/Controllers/auth_controller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController());
    // Get.put<CourtController>(CourtController());
    // Get.put<EmployeeController>(EmployeeController());
  }
}
