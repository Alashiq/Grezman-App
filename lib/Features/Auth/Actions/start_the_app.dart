import 'dart:convert';

import 'package:flutter_starter/Features/Auth/Controllers/auth_controller.dart';
import 'package:flutter_starter/Themes/Widgets/loading.dart';
import 'package:flutter_starter/Utils/logout.dart';
import 'package:get/get.dart';

import '../../../Config/shared_preferences.dart';
import '../../../Const/loading_status.dart';
import '../../../Themes/Alerts/errorMessage.dart';
import '../../../Utils/api.dart';
import '../Models/user_model.dart';

mixin StartTheAppMixin {
  startTheApp() async {
    final AuthController authController = Get.find();
    await Future.delayed(Duration(milliseconds: 3000), () {});
    if (await loadString("token") == null)
      Get.offAndToNamed("/login");
    else {
      authController.auth();
    }
  }
}
