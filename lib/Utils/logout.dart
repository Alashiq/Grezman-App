import 'package:get/get.dart';

import '../Features/Auth/Controllers/auth_controller.dart';

class Logout {
  logout() {
    AuthController authController = Get.find();
    authController.logout();
    print("logout is Done");
  }
}
