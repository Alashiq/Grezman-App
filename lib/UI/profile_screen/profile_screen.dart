import 'package:flutter/material.dart';
import 'package:flutter_starter/Themes/Widgets/main_layout.dart';
import 'package:get/get.dart';

import '../../Features/Auth/Controllers/auth_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      pageId: 3,
      title: 'حسابي',
      child: GetBuilder<AuthController>(
        builder: (authController) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 100),
            Container(
              padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
              child: Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.width * 0.5 - 30,
                    width: MediaQuery.of(context).size.width * 0.5 - 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: Color(0xffeeeeee), width: 1.2),
                    ),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 10),
                        Text(
                          "كشف " + authController.user!.firstname!,
                          style: TextStyle(
                            fontFamily: 'Swissra-Normal',
                            color: Color(0xff0f49a3),
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    height: MediaQuery.of(context).size.width * 0.5 - 30,
                    width: MediaQuery.of(context).size.width * 0.5 - 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: Color(0xffeeeeee), width: 1.2),
                    ),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 10),
                        Text(
                          "تحaaويل أموال",
                          style: TextStyle(
                            fontFamily: 'Swissra-Normal',
                            color: Color(0xff0f49a3),
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: Color(0xffeeeeee), width: 1.2),
                ),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(
                      "قم بقراءة الكود التالي لتحويل الأموال",
                      style: TextStyle(
                        fontFamily: 'Swissra-Normal',
                      ),
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
