import 'dart:convert';

import 'package:flutter_starter/Config/shared_preferences.dart';
import 'package:flutter_starter/Themes/Widgets/loading.dart';
import 'package:get/get.dart';

import '../../../Const/loading_status.dart';
import '../../../Utils/api.dart';
import '../Controllers/auth_controller.dart';
import '../Models/user_model.dart';

mixin LogoutMixin {
  logout() async {
    final AuthController authController = Get.find();
    // Call API
    try {
      showLoading();
      await SharedApi().postAuth(
        urlPath: 'user/logout',
        bodyData: json.encode({}),
      );
      stopLoading();

      removeString("token");
      Get.toNamed("/login");
      authController.user = UserModel.fromJson({
        "loadState": LoadingStatus.NOT_STARTED,
      });
    } on Exception catch (_) {
      stopLoading();
      removeString("token");
      Get.toNamed("/login");
      authController.user = UserModel.fromJson({
        "loadState": LoadingStatus.NOT_STARTED,
      });
    }
    // End Call API
  }
}
