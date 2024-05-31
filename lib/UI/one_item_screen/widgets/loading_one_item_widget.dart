import 'package:flutter/material.dart';
import 'package:flutter_starter/Features/Item/Models/one_item_model.dart';
import 'package:flutter_starter/Themes/ScreenStatus/no_permisson.dart';

import '../../../Utils/screen_size.dart';
import '../../../Themes/ScreenStatus/empty_box.dart';
import '../../../Themes/ScreenStatus/no_network.dart';
import '../../../Themes/ScreenStatus/reload_inside.dart';
import '../../../Themes/ScreenStatus/something_wrong.dart';

class LoadingOneItemWidget extends StatelessWidget {
  final OneItemModel? item;
  final Function load;
  const LoadingOneItemWidget({
    super.key,
    required this.item,
    required this.load,
  });

  @override
  Widget build(BuildContext context) {
    return item!.isLoading()
        ? ReloadInside(
            height: screenHeight(context, 128),
          )
        : item!.isLoadSuccess()
            ? Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: Color(0xffeeeeee), width: 1.2),
                    ),
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Text(
                      item!.name ?? 'لا يوجد إسم',
                      style: TextStyle(
                        fontFamily: 'Swissra-Normal',
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: Color(0xffeeeeee), width: 1.2),
                    ),
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Text(
                      item!.description ?? 'لا يوجد وصف',
                      style: TextStyle(
                        fontFamily: 'Swissra-Normal',
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              )
            : item!.isEmpty()
                ? EmptyBox(onInit: load, height: screenHeight(context, 128))
                : item!.isNoPermission()
                    ? NoPermisson(
                        onInit: load, height: screenHeight(context, 128))
                    : item!.isNoInternet()
                        ? NoNetwork(
                            onInit: load, height: screenHeight(context, 128))
                        : SomethingWrong(
                            onInit: load,
                            height: screenHeight(context, 128),
                          );
  }
}
