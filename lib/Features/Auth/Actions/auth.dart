import 'dart:convert';

import 'package:flutter_starter/Features/Auth/Controllers/auth_controller.dart';
import 'package:flutter_starter/Themes/Widgets/loading.dart';
import 'package:flutter_starter/Utils/logout.dart';
import 'package:get/get.dart';

import '../../../Config/shared_preferences.dart';
import '../../../Const/loading_status.dart';
import '../../../Themes/Alerts/errorMessage.dart';
import '../../../Themes/Alerts/internetMessage.dart';
import '../../../Utils/api.dart';
import '../Models/user_model.dart';

mixin AuthMixin {
  auth() async {
    final AuthController authController = Get.find();

    // Call API
    try {
      showLoading();
      authController.user = UserModel.fromJson({
        "token": await loadString("token"),
        "loadState": LoadingStatus.IN_PROGRESS,
      });
      authController.update();
      await Future.delayed(Duration(milliseconds: 1000), () {});

      final response = await SharedApi().getAuth(urlPath: 'user/profile');
      stopLoading();
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        jsonData['user']['loadState'] = LoadingStatus.DONE;
        authController.user = UserModel.fromJson(jsonData['user']);

        if (authController.user!.status == 1)
          Get.toNamed("/signup");
        else
          Get.toNamed("/home");
      } else if (response.statusCode == 401) {
        final jsonData = json.decode(response.body);
        showErrorMessage(jsonData['message']);
        Logout().logout();
      } else {
        final jsonData = json.decode(response.body);
        authController.user = UserModel.fromJson({
          "loadState": LoadingStatus.BAD_REQUEST,
        });
        showErrorMessage("حدث خطأ ما");
      }
      authController.update();
    } on Exception catch (_) {
      stopLoading();
      authController.user = UserModel.fromJson({
        "loadState": LoadingStatus.NO_INTERNET,
      });
      authController.update();
      showInternetMessage("تأكد من إتصالك بالإنترنت");
    }
    // End Call API
  }
}
