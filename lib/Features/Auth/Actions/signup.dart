import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_starter/Themes/Widgets/loading.dart';
import 'package:get/get.dart';

import '../../../Const/loading_status.dart';
import '../../../Themes/Alerts/error_message.dart';
import '../../../Themes/Alerts/internetMessage.dart';
import '../../../Utils/api.dart';
import '../../../Utils/logout.dart';
import '../Controllers/auth_controller.dart';
import '../Models/user_model.dart';

mixin SignupMixin {
  TextEditingController firstNameIn = TextEditingController();
  TextEditingController lastNameIn = TextEditingController();

  signup() async {
    final AuthController authController = Get.find();

    // Validation

    // Call API
    try {
      showLoading();
      final response = await SharedApi().postAuth(
        urlPath: 'user/signup',
        bodyData: json.encode({
          'first_name': firstNameIn.text,
          'last_name': lastNameIn.text,
        }),
      );
      stopLoading();
      print(response.statusCode);
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        jsonData['user']['loadState'] = LoadingStatus.DONE;
        authController.user = UserModel.fromJson(jsonData['user']);
        Get.offAllNamed("/home");
      } else if (response.statusCode == 401) {
        Logout().logout();
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
