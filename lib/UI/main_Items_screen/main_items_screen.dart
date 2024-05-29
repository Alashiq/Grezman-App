import 'package:flutter/material.dart';
import 'package:flutter_starter/Features/Item/Controllers/item_controller.dart';
import 'package:flutter_starter/Features/Item/Models/items_model.dart';
import 'package:flutter_starter/UI/main_Items_screen/widgets/loading_items_list_widget.dart';
import 'package:flutter_starter/Themes/Widgets/main_layout.dart';
import 'package:flutter_starter/Utils/auto_load.dart';
import 'package:get/get.dart';

class MainItemsScreen extends StatelessWidget {
  const MainItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      pageId: 2,
      title: 'قائمة العناصر',
      child: GetBuilder<ItemController>(
        builder: (itemController) => AutoLoad(
            onInit: () async {
              itemController.itemsList!.page = 1;
              itemController.loadItems();
            },

            //
            //
            child: LoadingItemsListWidget(
              list: itemController.itemsList!,
              load: itemController.loadItems,
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
