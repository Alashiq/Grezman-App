import 'package:flutter/material.dart';
import 'package:flutter_starter/Features/Notification/Models/items_model.dart';
import 'package:flutter_starter/Themes/ScreenStatus/no_permisson.dart';

import '../../../Utils/screen_size.dart';
import '../../../Themes/ScreenStatus/empty_box.dart';
import '../../../Themes/ScreenStatus/no_network.dart';
import '../../../Themes/ScreenStatus/reload_inside.dart';
import '../../../Themes/ScreenStatus/something_wrong.dart';

class LoadingNotificationsListWidget extends StatelessWidget {
  final NotificationListModel? list;
  final Function load;
  const LoadingNotificationsListWidget({
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
                  ListView.builder(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: list!.list!.length,
                    itemBuilder: (context, i) {
                      return NotificationItemWidget(item: list!.list![i]);
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

class ItemNotificationWidget extends StatelessWidget {
  final NotificationItemModel item;
  const ItemNotificationWidget({super.key, required this.item});

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
      child: Column(
        children: [
          Container(
            child: Text(
              item.title!,
              style: TextStyle(
                fontFamily: 'Swissra-Normal',
                fontSize: 18,
              ),
            ),
          ),
          Text(
            item.content!,
            style: TextStyle(
              fontFamily: 'Swissra-Normal',
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationItemWidget extends StatelessWidget {
  final NotificationItemModel item;

  const NotificationItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Color(0xffeeeeee), width: 1.2),
      ),
      padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 52,
            width: 52,
            decoration: BoxDecoration(
              color: Color(0xffecf4fb),
              borderRadius: BorderRadius.circular(60),
            ),
            alignment: Alignment.center,
            child: Icon(
              Icons.notifications_outlined,
              size: 32,
              color: Color(0xff1d77cd),
            ),
          ),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),
              Text(
                item.title!,
                style: TextStyle(
                  fontFamily: 'Swissra-Medium',
                  color: Color(0xff121212),
                  fontSize: 17,
                ),
              ),
              SizedBox(
                width: 16,
                height: 4,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 160,
                child: Text(
                  item.content!,
                  textAlign: TextAlign.start,
                  maxLines: null,
                  style: TextStyle(
                      color: Color(0XFf5a5a5a),
                      fontFamily: 'Swissra-Normal',
                      fontSize: 12),
                ),
              ),
              SizedBox(height: 15),
              Container(
                width: MediaQuery.of(context).size.width - 130,
                alignment: Alignment.centerLeft,
                child: Text(
                  item.created_at!,
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff8a8a8a),
                    fontFamily: 'Swissra-Normal',
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
