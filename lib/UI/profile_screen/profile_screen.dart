import 'package:flutter/material.dart';
import 'package:flutter_starter/Themes/Widgets/main_layout.dart';
import 'package:get/get.dart';

import '../../Features/Auth/Controllers/auth_controller.dart';
import '../../Utils/logout.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      pageId: 3,
      title: 'الملف الشخصي',
      child: GetBuilder<AuthController>(
        builder: (authController) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                SizedBox(height: 60),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 48,
                        width: 48,
                        //color: Colors.blue,
                      ),
                      SizedBox(width: 20),
                      Container(
                        padding: EdgeInsets.all(4.5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Color(0xff798eff),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Color(0xfff4f9ff),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(70),
                            child: Image.network(
                              authController.user!.photo!,
                              height: 110,
                              width: 110,
                              alignment: Alignment.center,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            width: 1,
                            color: Color(0xffdfe8f6),
                          ),
                        ),
                        child: IconButton(
                          onPressed: () async {},
                          icon: Icon(
                            Icons.photo_camera,
                            size: 26,
                            color: Color(0xffb0c1df),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
//
//
//
//

                authController.openEditName == false
                    ? Container(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 35,
                              width: 22,
                              alignment: Alignment.topCenter,
                            ),
                            Text(
                              authController.user!.firstname! +
                                  " " +
                                  authController.user!.lastname!,
                              style: TextStyle(
                                color: Color(0XFF455975),
                                fontFamily: 'Swissra-Normal',
                                fontSize: 19,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                authController.openEditName = true;
                                authController.update();
                                authController.firstNameEditIn.text =
                                    authController.user!.firstname!;
                                authController.lastNameEditIn.text =
                                    authController.user!.lastname!;
                              },
                              child: Container(
                                height: 35,
                                width: 22,
                                // color: Colors.blue,
                                alignment: Alignment.topCenter,
                                child: Icon(
                                  Icons.mode_edit,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    :
                    // Edit Form
                    Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 44,
                                  width: 135,
                                  child: TextField(
                                    controller: authController.firstNameEditIn,
                                    style: TextStyle(
                                      fontFamily: 'Swissra-Normal',
                                    ),
                                    decoration: InputDecoration(
                                      hintText: 'الإسم',
                                      hintStyle: TextStyle(
                                        fontFamily: 'Swissra-Normal',
                                        height: 1.24,
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xffe8ebf7),
                                            width: 1.4),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xffe8ebf7),
                                            width: 1.4),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide(
                                            color: Color(0xffe8ebf7),
                                            width: 1.4),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 2, horizontal: 14),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5),
                                Container(
                                  height: 44,
                                  width: 135,
                                  child: TextField(
                                    controller: authController.lastNameEditIn,
                                    style: TextStyle(
                                      fontFamily: 'Swissra-Normal',
                                    ),
                                    decoration: InputDecoration(
                                      hintText: 'الإسم',
                                      hintStyle: TextStyle(
                                        fontFamily: 'Swissra-Normal',
                                        height: 1.24,
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xffe8ebf7),
                                            width: 1.4),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xffe8ebf7),
                                            width: 1.4),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide(
                                            color: Color(0xffe8ebf7),
                                            width: 1.4),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 2, horizontal: 14),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 36,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      await authController.editName();
                                    },
                                    child: Container(
                                      padding: EdgeInsets.only(top: 4),
                                      child: Text(
                                        "حفظ",
                                        style: TextStyle(
                                          fontFamily: 'Swissra-Normal',
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        )),
                                  ),
                                ),
                                SizedBox(width: 5),
                                IconButton(
                                    onPressed: () {
                                      authController.openEditName = false;
                                      authController.update();
                                    },
                                    icon: Icon(
                                      Icons.close,
                                      size: 20,
                                      color: Colors.red,
                                    ))
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
//

                // End Edit Form
                SizedBox(height: 6),
                Text(
                  authController.user!.phone!,
                  style: TextStyle(
                    color: Color(0XFF455975),
                    fontFamily: 'JF-Flat',
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 45),
                Container(
                  height: 60,
                  margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
                  decoration: BoxDecoration(
                    color: Color(0xffedf2fb),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: 15),
                        Icon(
                          Icons.attach_money,
                          color: Color(0XFF546882),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "الرصيد",
                          style: TextStyle(
                            fontFamily: 'JF-Flat',
                            fontSize: 16,
                            color: Color(0XFF546882),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          padding: EdgeInsets.fromLTRB(9, 3.5, 9, 3.5),
                          decoration: BoxDecoration(
                            color: Color(0XFF546882),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            authController.user!.balance!.toString() + " دينار",
                            style: TextStyle(
                              fontFamily: 'JF-Flat',
                              fontSize: 16,
                              color: Color(0XFFffffff),
                            ),
                          ),
                        ),
                        Expanded(child: Container()),
                        SizedBox(width: 15),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20),
                Container(
                  height: 60,
                  margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
                  decoration: BoxDecoration(
                    color: Color(0xffedf2fb),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: InkWell(
                    onTap: () {
                      Get.toNamed("/notifications");
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: 15),
                        Icon(
                          Icons.notifications_active_outlined,
                          color: Color(0XFF546882),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "الإشعارات",
                          style: TextStyle(
                            fontFamily: 'JF-Flat',
                            fontSize: 16,
                            color: Color(0XFF546882),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          padding: EdgeInsets.fromLTRB(15, 3, 15, 2),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            authController.user!.notifications.toString(),
                            style: TextStyle(
                              fontFamily: 'JF-Flat',
                              fontSize: 16,
                              color: Color(0XFFffffff),
                            ),
                          ),
                        ),
                        Expanded(child: Container()),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0XFF546882),
                        ),
                        SizedBox(width: 15),
                      ],
                    ),
                  ),
                ),

                // Logout Btn
                SizedBox(height: 30),
                Container(
                  height: 46,
                  width: 46,
                  margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
                  decoration: BoxDecoration(
                    color: Color(0xffedf2fb),
                    borderRadius: BorderRadius.circular(9),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0.00, 2.00),
                        color: Color(0xff363333).withOpacity(0.16),
                        blurRadius: 12,
                      ),
                    ],
                  ),
                  child: IconButton(
                    onPressed: () => Logout().logout(),
                    icon: Icon(
                      Icons.logout_outlined,
                      color: Color(0XFF546882),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                OutlinedButton(
                  onPressed: () {
                    Get.toNamed("/remove_account");
                  },
                  child: Text(
                    "حذف الحساب",
                    style: TextStyle(
                      color: Colors.red,
                      fontFamily: 'JF-Flat',
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide.none,
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
            // BottomBar(activeId: 4),
          ],
        ),
      ),
    );
  }
}
