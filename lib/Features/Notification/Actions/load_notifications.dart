import 'dart:convert';

import 'package:flutter_starter/Features/Auth/Controllers/auth_controller.dart';
import 'package:flutter_starter/Features/Item/Models/items_model.dart';
import 'package:flutter_starter/Features/Notification/Models/items_model.dart';
import 'package:flutter_starter/Utils/logout.dart';
import 'package:get/get.dart';

import '../../../Const/loading_status.dart';
import '../../../Themes/Alerts/internetMessage.dart';
import '../../../Themes/Snakbars/response_snakbar.dart';
import '../../../Utils/api.dart';
import '../Controllers/notification_controller.dart';

mixin LoadNotificationsMixin {
  NotificationListModel? itemsList = NotificationListModel.initial();

  loadItems() async {
    final NotificaionController notificaionController = Get.find();
    final AuthController authController = Get.find();

    try {
      if (itemsList!.page == 1) {
        itemsList = NotificationListModel.proccess();
      } else {
        itemsList!.loadState = LoadingStatus.IN_SECOND_PROGRESS;
      }
      notificaionController.update();
      await Future.delayed(Duration(milliseconds: 1000), () {});

      final response = await SharedApi()
          .getAuth(urlPath: 'notification?page=${itemsList!.page}');

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);

        if (itemsList!.page == 1) {
          itemsList = NotificationListModel.firstDone(
              itemsList!.page!, jsonData['data']);
          authController.user!.notifications = 0;
          authController.update();
        } else {
          itemsList!.list!.addAll(NotificationListModel.fromJson({
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
      notificaionController.update();
    } on Exception catch (_) {
      if (itemsList!.page != 1) {
        itemsList!.loadState = LoadingStatus.DONE;
      } else {
        itemsList = NotificationListModel.disconnect();
      }
      notificaionController.update();
      showInternetMessage("تأكد من إتصالك بالإنترنت");
    }
    // End Call API
  }
}
