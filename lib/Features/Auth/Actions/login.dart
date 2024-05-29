import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_starter/Themes/Widgets/loading.dart';
import 'package:get/get.dart';

import '../../../Themes/Alerts/errorMessage.dart';
import '../../../Themes/Alerts/internetMessage.dart';
import '../../../Utils/api.dart';
import '../Controllers/auth_controller.dart';

mixin LoginMixin {
  TextEditingController phoneLoginIn = TextEditingController();
  login() async {
    final AuthController authController = Get.find();

    // Validation

    // Call API
    try {
      showLoading();
      final response = await SharedApi().postNoAuth(
        urlPath: 'login',
        bodyData: json.encode({
          'phone': phoneLoginIn.text,
        }),
      );
      stopLoading();
      if (response.statusCode == 200) {
        authController.phone = phoneLoginIn.text;
        phoneLoginIn.clear();
        Get.toNamed("/activate");
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
