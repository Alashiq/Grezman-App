import 'dart:convert';

import 'package:flutter_starter/Features/Item/Models/items_model.dart';
import 'package:flutter_starter/Utils/logout.dart';
import 'package:get/get.dart';

import '../../../Const/loading_status.dart';
import '../../../Themes/Alerts/internetMessage.dart';
import '../../../Themes/Snakbars/response_snakbar.dart';
import '../../../Utils/api.dart';
import '../Controllers/item_controller.dart';

mixin LoadItemsMixin {
  ItemListModel? itemsList = ItemListModel.initial();

  loadItems() async {
    final ItemController itemController = Get.find();

    try {
      if (itemsList!.page == 1) {
        itemsList = ItemListModel.proccess();
      } else {
        itemsList!.loadState = LoadingStatus.IN_SECOND_PROGRESS;
      }
      itemController.update();

      await Future.delayed(Duration(milliseconds: 500), () {});

      final response =
          await SharedApi().getAuth(urlPath: 'item?page=${itemsList!.page}');

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        if (itemsList!.page == 1) {
          itemsList =
              ItemListModel.firstDone(itemsList!.page!, jsonData['data']);
          // itemsList = ItemListModel.fromJson({
          //   "loadState": LoadingStatus.DONE,
          //   "page": itemsList!.page! + 1,
          //   "last_page": jsonData['data']['last_page'],
          //   "list": jsonData['data']['data'],
          // });
        } else {
          itemsList!.list!.addAll(ItemListModel.fromJson({
            "list": jsonData['data']['data'],
          }).list!);
          itemsList!.loadState = LoadingStatus.DONE;
          itemsList!.page = itemsList!.page! + 1;
        }
      } else if (response.statusCode == 401) {
        Logout().logout();
      } else if (itemsList!.page != 1) {
        itemsList!.loadState = LoadingStatus.DONE;
        responseSnakbarError(response.statusCode);
      } else if (response.statusCode == 204) {
        itemsList!.loadState = LoadingStatus.EMPTY;
      } else if (response.statusCode == 400) {
        itemsList!.loadState = LoadingStatus.BAD_REQUEST;
      } else if (response.statusCode == 403) {
        itemsList!.loadState = LoadingStatus.No_Permission;
      } else {
        itemsList!.loadState = LoadingStatus.BAD_REQUEST;
      }

      itemController.update();
    } on Exception catch (_) {
      if (itemsList!.page != 1) {
        itemsList!.loadState = LoadingStatus.DONE;
      } else {
        itemsList = ItemListModel.fromJson({
          "loadState": LoadingStatus.NO_INTERNET,
          "page": 1,
          "last_page": 1,
          "list": [],
        });
      }
      itemController.update();
      showInternetMessage("تأكد من إتصالك بالإنترنت");
    }
    // End Call API
  }
}
