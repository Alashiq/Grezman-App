import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Features/Auth/Controllers/auth_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GetBuilder<AuthController>(
        builder: (authController) => Scaffold(
          backgroundColor: Color(0xfffafbfd),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        SizedBox(height: 200),
                        Container(
                          child: Image.asset(
                            "assets/img/logo.png",
                            height: 120,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        alignment: Alignment.center,
                        child: Text(
                          'مرحبا بك',
                          style: TextStyle(
                            color: Color(0xff0f49a3),
                            fontSize: 26,
                            fontFamily: 'Swissra-Medium',
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      Container(
                        margin: EdgeInsets.only(left: 35, right: 35),
                        child: Column(
                          children: [
                            TextField(
                              controller: authController.phoneLoginIn,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.tag,
                                  color: Color(0xffe9751f),
                                ),
                                hintText: 'رقم الهاتف',
                                hintStyle: TextStyle(
                                    fontFamily: 'Swissra-Normal', height: 1.87),
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xffe8ebf7), width: 1.4),
                                  borderRadius: BorderRadius.circular(22),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xffe8ebf7), width: 1.4),
                                  borderRadius: BorderRadius.circular(22),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(22),
                                  borderSide: BorderSide(
                                      color: Color(0xffe8ebf7), width: 1.4),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 20),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Container(
                              height: 60,
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () => authController.login(),
                                style: ElevatedButton.styleFrom(
                                  elevation: 0.4,
                                  backgroundColor: Color(0xff7886e9),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: Text(
                                  "تسجيل الدخول",
                                  style: TextStyle(
                                    fontFamily: 'Swissra-Normal',
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
