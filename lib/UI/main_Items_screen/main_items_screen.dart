import 'package:flutter/material.dart';
import 'package:flutter_starter/Features/Item/Controllers/item_controller.dart';
import 'package:flutter_starter/Themes/Widgets/main_layout.dart';
import 'package:flutter_starter/Utils/auto_load.dart';
import 'package:get/get.dart';

import '../../Themes/ScreenStatus/empty_box.dart';
import '../../Themes/ScreenStatus/no_network.dart';
import '../../Themes/ScreenStatus/reload_inside.dart';
import '../../Themes/ScreenStatus/something_wrong.dart';
import '../../Utils/screen_size.dart';

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
          child: itemController.itemsList!.isLoading()
              ? ReloadInside(
                  height: screenHeight(context, 128),
                )
              : itemController.itemsList!.isLoadSuccess() ||
                      itemController.itemsList!.isSecondLoading()
                  ? Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemCount: itemController.itemsList!.list!.length,
                          itemBuilder: (context, i) {
                            return ListTile(
                              title: Text(
                                  itemController.itemsList!.list![i].name ??
                                      "Empty"),
                            );
                          },
                        ),
                        Text(itemController.itemsList?.last_page.toString() ??
                            "0"),
                        Text(itemController.itemsList?.Count.toString() ?? "0"),
                        itemController.itemsList!.isSecondLoading()
                            ? CircularProgressIndicator()
                            : ElevatedButton(
                                onPressed: () {
                                  itemController.loadItems();
                                },
                                child: Text("Next"))
                      ],
                    )
                  : itemController.itemsList!.isEmpty()
                      ? EmptyBox(
                          onInit: itemController.loadItems,
                          height: screenHeight(context, 128))
                      : itemController.itemsList!.isNoInternet()
                          ? NoNetwork(
                              onInit: itemController.loadItems,
                              height: screenHeight(context, 128))
                          : SomethingWrong(
                              onInit: itemController.loadItems,
                              height: screenHeight(context, 128),
                            ),

          //
          //
        ),
      ),
    );
  }
}
