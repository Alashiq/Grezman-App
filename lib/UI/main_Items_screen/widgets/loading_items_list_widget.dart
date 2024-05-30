import 'package:flutter/material.dart';
import 'package:flutter_starter/Themes/ScreenStatus/no_permisson.dart';
import 'package:get/get.dart';

import '../../../Features/Item/Models/items_model.dart';
import '../../../Utils/screen_size.dart';
import '../../../Themes/ScreenStatus/empty_box.dart';
import '../../../Themes/ScreenStatus/no_network.dart';
import '../../../Themes/ScreenStatus/reload_inside.dart';
import '../../../Themes/ScreenStatus/something_wrong.dart';

class LoadingItemsListWidget extends StatelessWidget {
  final ItemListModel? list;
  final Function load;
  const LoadingItemsListWidget({
    super.key,
    required this.list,
    required this.load,
  });

  @override
  Widget build(BuildContext context) {
    return list!.isLoading()
        ? ReloadInside(
            height: screenHeight(context, 128),
          )
        : list!.isLoadSuccess() || list!.isSecondLoading()
            ? Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 140,
                      child: ElevatedButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            SizedBox(width: 5),
                            Container(
                              padding: EdgeInsets.only(top: 3),
                              child: Text(
                                "اضف عنصر",
                                style: TextStyle(
                                  fontFamily: 'Swissra-Medium',
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                        onPressed: () => Get.toNamed("/new_item"),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          backgroundColor: Color(0xff229bb7),
                        ),
                      ),
                    ),
                  ),
                  ListView.builder(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: list!.list!.length,
                    itemBuilder: (context, i) {
                      return ItemWidget(item: list!.list![i]);
                    },
                  ),
                  list!.isSecondLoading()
                      ? CircularProgressIndicator()
                      : Container(
                          width: 130,
                          height: 44,
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xff229bb7),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9),
                                  )),
                              onPressed: () {
                                load();
                              },
                              child: Text(
                                "المزيد",
                                style: TextStyle(
                                  fontFamily: 'Swissra-Normal',
                                  fontSize: 16,
                                  color: Colors.white,
                                  height: 2.91,
                                ),
                              )),
                        )
                ],
              )
            : list!.isEmpty()
                ? EmptyBox(onInit: load, height: screenHeight(context, 128))
                : list!.isNoPermission()
                    ? NoPermisson(
                        onInit: load, height: screenHeight(context, 128))
                    : list!.isNoInternet()
                        ? NoNetwork(
                            onInit: load, height: screenHeight(context, 128))
                        : SomethingWrong(
                            onInit: load,
                            height: screenHeight(context, 128),
                          );
  }
}

class ItemWidget extends StatelessWidget {
  final ItemItemModel item;
  const ItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Color(0xffeeeeee), width: 1.2),
      ),
      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Text(
        item.name!,
        style: TextStyle(
          fontFamily: 'Swissra-Normal',
          fontSize: 18,
        ),
      ),
    );
  }
}
