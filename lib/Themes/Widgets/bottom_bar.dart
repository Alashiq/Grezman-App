import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BottomBar extends StatelessWidget {
  final int activeTab;
  const BottomBar({super.key, required this.activeTab});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
          height: 80,
          color: Colors.white,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavigationItemWidget(
                img: "assets/svg/home.svg",
                isActive: activeTab == 1 ? true : false,
                label: "الرئيسية",
                route: "/home",
              ),
              NavigationItemWidget(
                img: "assets/svg/bill.svg",
                isActive: activeTab == 2 ? true : false,
                label: "الفاتورة",
                route: "/main_items",
              ),
              NavigationItemWidget(
                img: "assets/svg/user.svg",
                isActive: activeTab == 3 ? true : false,
                label: "حسابي",
                route: "/profile",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavigationItemWidget extends StatelessWidget {
  final String img;
  final bool isActive;
  final String label;
  final String route;
  const NavigationItemWidget(
      {super.key,
      required this.img,
      required this.isActive,
      required this.label,
      required this.route});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(context, SlideRight(page: ProfileScreen(), way: -1.0));
        Get.offAndToNamed(route);
      },
      child: Container(
        height: 44,
        width: 110,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isActive ? Color(0xffe8f1f9) : Color(0xffffffff),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              img,
              width: 26,
              color: isActive ? Color(0xffe9751f) : Color(0xff8a8a8a),
            ),
            SizedBox(width: 6),
            isActive
                ? Text(
                    "${label}",
                    style: TextStyle(
                        fontFamily: 'Swissra-Normal',
                        fontSize: 15,
                        height: 2.88,
                        color: Color(0xff0f49a3)),
                  )
                : Text(
                    "${label}",
                    style: TextStyle(
                        fontFamily: 'Swissra-Normal',
                        fontSize: 15,
                        height: 2.88,
                        color: Colors.white),
                  )
          ],
        ),
      ),
    );
  }
}
