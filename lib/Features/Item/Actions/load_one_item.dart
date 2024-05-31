import 'dart:convert';

import 'package:flutter_starter/Features/Item/Models/items_model.dart';
import 'package:flutter_starter/Features/Item/Models/one_item_model.dart';
import 'package:flutter_starter/Utils/logout.dart';
import 'package:get/get.dart';

import '../../../Const/loading_status.dart';
import '../../../Themes/Alerts/internetMessage.dart';
import '../../../Utils/api.dart';
import '../Controllers/item_controller.dart';

mixin LoadOneItemMixin {
  OneItemModel? oneItem = OneItemModel.initial();

  ItemItemModel? activeItem;
  loadOneItem() async {
    final ItemController itemController = Get.find();

    try {
      oneItem = OneItemModel.proccess();

      itemController.update();
      await Future.delayed(Duration(milliseconds: 1000), () {});
      final response = await SharedApi()
          .getAuth(urlPath: 'item/${activeItem != null ? activeItem!.id : 0}');

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        oneItem = OneItemModel.fromJson(jsonData['data']);
      } else if (response.statusCode == 401) {
        Logout().logout();
      } else if (response.statusCode == 204) {
        oneItem!.loadState = LoadingStatus.EMPTY;
      } else if (response.statusCode == 400) {
        oneItem!.loadState = LoadingStatus.BAD_REQUEST;
      } else if (response.statusCode == 403) {
        oneItem!.loadState = LoadingStatus.No_Permission;
      } else {
        oneItem!.loadState = LoadingStatus.BAD_REQUEST;
      }
      itemController.update();
    } on Exception catch (_) {
      oneItem = OneItemModel.disconnect();
      itemController.update();
      showInternetMessage("تأكد من إتصالك بالإنترنت");
    }
    // End Call API
  }
}
