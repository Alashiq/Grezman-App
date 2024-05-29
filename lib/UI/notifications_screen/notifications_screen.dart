import 'package:flutter/material.dart';
import 'package:flutter_starter/Features/Item/Models/items_model.dart';
import 'package:flutter_starter/Features/Notification/Controllers/notification_controller.dart';
import 'package:flutter_starter/Utils/auto_load.dart';
import 'package:get/get.dart';

import '../../Themes/Widgets/back_layout.dart';
import 'widgets/loading_notifications_list_widget.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackLayout(
      title: 'الإشعارات',
      child: GetBuilder<NotificaionController>(
        builder: (notificaionController) => AutoLoad(
            onInit: () async {
              notificaionController.itemsList!.page = 1;
              notificaionController.loadItems();
            },

            //
            //
            child: LoadingNotificationsListWidget(
              list: notificaionController.itemsList!,
              load: notificaionController.loadItems,
            ) //
            //
            ),
      ),
    );
  }
}

class ItemWidgetInList extends StatelessWidget {
  final ItemItemModel item;
  const ItemWidgetInList({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: Text(item.name!),
    );
  }
}
