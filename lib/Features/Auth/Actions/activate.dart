import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_starter/Themes/Widgets/loading.dart';
import 'package:get/get.dart';

import '../../../Config/shared_preferences.dart';
import '../../../Const/loading_status.dart';
import '../../../Themes/Alerts/error_message.dart';
import '../../../Themes/Alerts/internetMessage.dart';
import '../../../Utils/api.dart';
import '../Controllers/auth_controller.dart';
import '../Models/user_model.dart';

mixin ActivateMixin {
  TextEditingController otpIn = TextEditingController();

  activate() async {
    final AuthController authController = Get.find();

    // Validation

    // Call API
    try {
      showLoading();
      authController.user = UserModel.fromJson({
        "loadState": LoadingStatus.IN_PROGRESS,
      });

      final response = await SharedApi().postNoAuth(
        urlPath: 'activate',
        bodyData: json.encode({
          'phone': authController.phone,
          'otp': otpIn.text,
        }),
      );
      stopLoading();
      print(response.statusCode);
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        jsonData['user']['loadState'] = LoadingStatus.DONE;
        authController.user = UserModel.fromJson(jsonData['user']);
        otpIn.clear();
        print(authController.user!.token!);
        saveString("token", authController.user!.token!);

        if (authController.user!.status == 1)
          Get.toNamed("/signup");
        else
          Get.toNamed("/home");
      } else {
        final jsonData = json.decode(response.body);
        showErrorMessage(jsonData['message']);
      }
    } on Exception catch (_) {
      stopLoading();
      showInternetMessage("تأكد من إتصالك بالإنترنت");
    }
    // End Call API
  }
}
