import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Themes/Alerts/error_message.dart';
import '../../../Themes/Alerts/internetMessage.dart';
import '../../../Themes/Alerts/successMessage.dart';
import '../../../Themes/Widgets/loading.dart';
import '../../../Utils/api.dart';
import '../../../Utils/logout.dart';
import '../Controllers/auth_controller.dart';

mixin EditNameMixin {
  bool openEditName = false;
  TextEditingController firstNameEditIn = TextEditingController();
  TextEditingController lastNameEditIn = TextEditingController();

  editName() async {
    final AuthController authController = Get.find();

    // Call API
    try {
      showLoading();
      final response = await SharedApi().postAuth(
        urlPath: 'user/name',
        bodyData: json.encode({
          'first_name': firstNameEditIn.text,
          'last_name': lastNameEditIn.text,
        }),
      );
      stopLoading();

      if (response.statusCode == 200) {
        authController.user!.firstname = firstNameEditIn.text;
        authController.user!.lastname = lastNameEditIn.text;
        openEditName = false;
        authController.update();
        showSuccessMessage("تم تحديث الإسم بنجاح");
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
  }
}
