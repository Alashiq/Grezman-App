import 'package:flutter_starter/Features/Auth/Controllers/auth_controller.dart';
import 'package:get/get.dart';

import '../../../Config/shared_preferences.dart';

mixin StartTheAppMixin {
  startTheApp() async {
    final AuthController authController = Get.find();
    await Future.delayed(Duration(milliseconds: 3000), () {});

    print(await loadString("token"));
    if (await loadString("token") == null) Get.offAndToNamed("/login");
  }
}
