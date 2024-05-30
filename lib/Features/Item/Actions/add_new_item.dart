import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_starter/Features/Item/Requests/item_request.dart';
import 'package:flutter_starter/Themes/Alerts/successMessage.dart';
import 'package:flutter_starter/Utils/logout.dart';
import 'package:get/get.dart';

import '../../../Themes/Alerts/errorMessage.dart';
import '../../../Themes/Alerts/internetMessage.dart';
import '../../../Themes/Widgets/loading.dart';
import '../../../Utils/api.dart';
import '../Controllers/item_controller.dart';

mixin AddNewItemMixin {
  TextEditingController nameIn = TextEditingController();
  String nameValidation = "";
  TextEditingController descriptionIn = TextEditingController();
  String descriptionValidation = "";

  addNewItem() async {
    if (!validateName() || !validateDescription()) return 0;
    ItemRequest itemRequest =
        ItemRequest(name: nameIn.text, description: descriptionIn.text);
    try {
      print(json.encode(itemRequest.toJson()));
      showLoading();
      final response = await SharedApi().postAuth(
        urlPath: 'item',
        bodyData: json.encode(itemRequest.toJson()),
      );
      stopLoading();

      if (response.statusCode == 201) {
        nameIn.clear();
        descriptionIn.clear();
        final jsonData = json.decode(response.body);
        showSuccessMessage(jsonData['message']);
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

  bool validateName() {
    final ItemController itemController = Get.find();
    if (nameIn.text.length < 3) {
      nameValidation = "يجب عليك كتابة 3 أحرف على الأقل";
      itemController.update();

      return false;
    } else {
      nameValidation = "";
      itemController.update();
      return true;
    }
  }

  bool validateDescription() {
    final ItemController itemController = Get.find();
    if (descriptionIn.text.length < 3) {
      descriptionValidation = "يجب عليك كتابة 3 أحرف على الأقل";
      itemController.update();
      return false;
    } else {
      descriptionValidation = "";
      itemController.update();
      return true;
    }
  }
}
