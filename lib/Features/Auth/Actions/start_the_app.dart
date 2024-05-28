import 'package:flutter_starter/Features/Auth/Controllers/auth_controller.dart';
import 'package:get/get.dart';

import '../../../Config/shared_preferences.dart';

mixin StartTheAppMixin {
  startTheApp() async {
    final AuthController authController = Get.find();
    await Future.delayed(Duration(milliseconds: 3000), () {});
    if (await loadString("onboarding") == null)
      Get.offAndToNamed("/onboarding");
    else {
      if (await loadString("token") == null)
        Get.offAndToNamed("/login");
      else {
        authController.auth();
      }
    }
  }
}
