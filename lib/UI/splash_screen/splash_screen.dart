import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Features/Auth/Controllers/auth_controller.dart';
import '../../Utils/auto_load.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF6F7FC),
      body: GetBuilder<AuthController>(
        builder: (controller) => AutoLoad(
          onInit: controller.startTheApp,
          child: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Expanded(child: Container()),
                SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "تطبيق الطالب جامعة صبراته",
                    style: TextStyle(
                      fontFamily: 'Swissra-Normal',
                      color: Color(0xff5a5a5a),
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircularProgressIndicator(
                        color: Color(0xff229bb7),
                      ),
                      SizedBox(height: 40),
                      Text(
                        "مركز المعلومات والتوثيق",
                        style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'JF-Flat',
                        ),
                      ),
                      SizedBox(height: 15),
                      SizedBox(height: 40),
                    ],
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
