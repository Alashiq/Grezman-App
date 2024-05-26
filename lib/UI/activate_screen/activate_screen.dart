import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Features/Auth/Controllers/auth_controller.dart';
import '../../Utils/logout.dart';

class ActivateScreen extends StatelessWidget {
  const ActivateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final smsCodeIn = TextEditingController();

    smsCodeIn.text = "";
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GetBuilder<AuthController>(
        builder: (authController) => Scaffold(
          backgroundColor: Color(0xfffafbfd),
          appBar: AppBar(
            leading: IconButton(
              padding: EdgeInsets.only(right: 10),
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () {
                Logout().logout();

                Get.back();
              },
            ),
            backgroundColor: Color(0xff7886e9),
            title: const Text(
              "تأكيد الحساب",
              style: TextStyle(
                fontFamily: 'Swissra-Normal',
                color: Colors.white,
                fontSize: 19,
              ),
            ),
            centerTitle: true,
          ),
          body: GetBuilder<AuthController>(
            builder: (authController) => Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              //color: Color(0xff5561e3),
              color: Color(0xfffafafa),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      child: Text(
                    "تأكيد الحساب",
                    style: TextStyle(
                      fontFamily: 'Swissra-Normal',
                      color: Color(0XFF333333),
                      fontSize: 23,
                    ),
                  )),
                  SizedBox(height: 20),
                  Text(
                    "قم بإدخال رمز التفعيل الذي تم إرساله إلى هاتفك  إلى الرقم",
                    style: TextStyle(
                      fontFamily: 'JF-Flat',
                      fontSize: 13,
                      color: Color(0xff9a9a9a),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    authController.phone,
                    style: TextStyle(
                      color: Color(0xff7886e9),
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 20),
                  //   Test
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Container(
                      height: 70,
                      width: 300,
                      padding: EdgeInsets.only(top: 4),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(),
                      child: Container(
                        width: 300,
                        child: Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 4.8, 0, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 44,
                                    width: 44,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Color(0xffe8ebf7), width: 1.4),
                                      borderRadius: BorderRadius.circular(16),
                                      color: Color(0xffffffff),
                                    ),
                                    margin: EdgeInsets.fromLTRB(2.5, 0, 2.5, 0),
                                  ),
                                  Container(
                                    height: 44,
                                    width: 44,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Color(0xffe8ebf7), width: 1.4),
                                      borderRadius: BorderRadius.circular(16),
                                      color: Color(0xffffffff),
                                    ),
                                    margin: EdgeInsets.fromLTRB(2.5, 0, 2.5, 0),
                                  ),
                                  Container(
                                    height: 44,
                                    width: 44,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Color(0xffe8ebf7), width: 1.4),
                                      borderRadius: BorderRadius.circular(16),
                                      color: Color(0xffffffff),
                                    ),
                                    margin: EdgeInsets.fromLTRB(2.5, 0, 2.5, 0),
                                  ),
                                  Container(
                                    height: 44,
                                    width: 44,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Color(0xffe8ebf7), width: 1.4),
                                      borderRadius: BorderRadius.circular(16),
                                      color: Color(0xffffffff),
                                    ),
                                    margin: EdgeInsets.fromLTRB(2.5, 0, 2.5, 0),
                                  ),
                                  Container(
                                    height: 44,
                                    width: 44,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Color(0xffe8ebf7), width: 1.4),
                                      borderRadius: BorderRadius.circular(16),
                                      color: Color(0xffffffff),
                                    ),
                                    margin: EdgeInsets.fromLTRB(2.5, 0, 2.5, 0),
                                  ),
                                  Container(
                                    height: 44,
                                    width: 44,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Color(0xffe8ebf7), width: 1.4),
                                      borderRadius: BorderRadius.circular(16),
                                      color: Color(0xffffffff),
                                    ),
                                    margin: EdgeInsets.fromLTRB(2.5, 0, 2.5, 0),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: TextField(
                                cursorWidth: 0.0,

                                controller: authController.otpIn,
                                textAlign: TextAlign.left,
                                textDirection: TextDirection.rtl,
                                maxLength: 6,
                                //cursorWidth: 0,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 2.0),
                                  counter: Offstage(),
                                  border: InputBorder.none,
                                ),
                                style: TextStyle(
                                  fontFeatures: [FontFeature.tabularFigures()],
                                  color: Color(0xff353535),
                                  fontSize: 26,
                                  letterSpacing: 32.7,
                                  height: 1.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  //  End Test

                  Container(
                    margin: EdgeInsets.only(top: 25),
                    height: 44,
                    width: 180,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff7886e9),
                        elevation: 0.2,
                      ),
                      onPressed: () => authController.activate(),
                      child: Text(
                        "تفعيل",
                        style: TextStyle(
                          fontFamily: 'Swissra-Normal',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
