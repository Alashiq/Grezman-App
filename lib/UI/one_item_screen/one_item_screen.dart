import 'package:flutter/material.dart';
import 'package:flutter_starter/Features/Item/Controllers/item_controller.dart';
import 'package:flutter_starter/Themes/Widgets/back_layout.dart';
import 'package:flutter_starter/Utils/auto_load.dart';
import 'package:get/get.dart';

import 'widgets/loading_one_item_widget.dart';

class OneItemScreen extends StatelessWidget {
  const OneItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackLayout(
      title: 'بيانات العنصر',
      child: GetBuilder<ItemController>(
        builder: (itemController) => AutoLoad(
            onInit: () async {
              itemController.loadOneItem();
            },

            //
            //
            child: LoadingOneItemWidget(
              item: itemController.oneItem!,
              load: itemController.loadOneItem,
            ) //
            //
            ),
      ),
    );
  }
}
