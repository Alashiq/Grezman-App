import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Features/Auth/Controllers/auth_controller.dart';

class ActivateScreen extends StatelessWidget {
  const ActivateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final smsCodeIn = TextEditingController();

    smsCodeIn.text = "";
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff7886e9),
          title: const Text(
            "تأكيد الحساب",
            style: TextStyle(
              fontFamily: 'Swissra-Normal',
              color: Colors.white,
              fontSize: 17,
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
                    fontFamily: 'JF-Flat',
                    color: Color(0XFF4A4A4A),
                    fontSize: 21,
                  ),
                )),
                SizedBox(height: 20),
                Text(
                  "قم بإدخال رمز التفعيل الذي تم إرساله إلى هاتفك  إلى الرقم",
                  style: TextStyle(
                    fontFamily: 'JF-Flat',
                    fontSize: 12,
                    color: Color(0xff7a7a7a),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  authController.phone,
                  style: TextStyle(
                    fontFamily: 'JF-Flat',
                  ),
                ),
                SizedBox(height: 20),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Container(
                    height: 70,
                    width: 300,
                    padding: EdgeInsets.only(top: 4),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffdedede), width: 1.4),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                      width: 280,
                      child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 4.8, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 41,
                                  width: 41,
                                  decoration: BoxDecoration(
                                      color: Color(0xff7886e9),
                                      borderRadius: BorderRadius.circular(4)),
                                  margin: EdgeInsets.fromLTRB(2.5, 0, 2.5, 0),
                                ),
                                Container(
                                  height: 41,
                                  width: 41,
                                  decoration: BoxDecoration(
                                      color: Color(0xff7886e9),
                                      borderRadius: BorderRadius.circular(4)),
                                  margin: EdgeInsets.fromLTRB(2.5, 0, 2.5, 0),
                                ),
                                Container(
                                  height: 41,
                                  width: 41,
                                  decoration: BoxDecoration(
                                      color: Color(0xff7886e9),
                                      borderRadius: BorderRadius.circular(4)),
                                  margin: EdgeInsets.fromLTRB(2.5, 0, 2.5, 0),
                                ),
                                Container(
                                  height: 41,
                                  width: 41,
                                  decoration: BoxDecoration(
                                      color: Color(0xff7886e9),
                                      borderRadius: BorderRadius.circular(4)),
                                  margin: EdgeInsets.fromLTRB(2.5, 0, 2.5, 0),
                                ),
                                Container(
                                  height: 41,
                                  width: 41,
                                  decoration: BoxDecoration(
                                      color: Color(0xff7886e9),
                                      borderRadius: BorderRadius.circular(4)),
                                  margin: EdgeInsets.fromLTRB(2.5, 0, 2.5, 0),
                                ),
                                Container(
                                  height: 41,
                                  width: 41,
                                  decoration: BoxDecoration(
                                      color: Color(0xff7886e9),
                                      borderRadius: BorderRadius.circular(4)),
                                  margin: EdgeInsets.fromLTRB(2.5, 0, 2.5, 0),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: TextField(
                              controller: smsCodeIn,
                              textAlign: TextAlign.left,
                              textDirection: TextDirection.rtl,
                              maxLength: 6,
                              //cursorWidth: 0,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  counter: Offstage(),
                                  border: InputBorder.none,
                                  contentPadding:
                                      EdgeInsets.fromLTRB(1, 0, 0, 0)),
                              style: TextStyle(
                                fontFeatures: [FontFeature.tabularFigures()],
                                color: Colors.white,
                                fontSize: 26,
                                letterSpacing: 29.7,
                                height: 1.1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 25),
                  height: 44,
                  width: 180,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff7886e9),
                      elevation: 0.2,
                    ),
                    onPressed: () async {
                      // bool data = await controller.activate(smsCodeIn.text);
                      // if (data == true) {
                      //   smsCodeIn.clear();
                      // }
                    },
                    child: Text(
                      "تفعيل",
                      style: TextStyle(
                        fontFamily: 'Swissra-Normal',
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
