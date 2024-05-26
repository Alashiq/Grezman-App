import 'package:flutter/material.dart';
import 'package:flutter_starter/Config/shared_preferences.dart';
import 'package:flutter_starter/Features/Auth/Controllers/auth_controller.dart';
import 'package:flutter_starter/Utils/auto_load.dart';
import 'package:get/get.dart';

import '../../Const/loading_status.dart';
import '../../Features/Auth/Models/user_model.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GetBuilder<AuthController>(
        builder: (authController) => AutoLoad(
          onInit: () {
            authController.firstNameIn.clear();
            authController.lastNameIn.clear();
          },
          child: Scaffold(
            backgroundColor: Color(0xfffafbfd),
            appBar: AppBar(
              leading: IconButton(
                padding: EdgeInsets.only(right: 10),
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                onPressed: () {
                  Get.back();
                  removeString("token");
                  authController.user = UserModel.fromJson({
                    "loadState": LoadingStatus.NOT_STARTED,
                  });
                },
              ),
              actions: [
                IconButton(
                    padding: EdgeInsets.only(left: 10),
                    onPressed: () => authController.logout(),
                    icon: Icon(
                      Icons.logout,
                      color: Colors.white,
                    ))
              ],
              backgroundColor: Color(0xff7886e9),
              title: const Text(
                "مشترك جديد",
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15, right: 15),
                      child: Column(
                        children: [
                          TextField(
                            controller: authController.firstNameIn,
                            style: TextStyle(
                              fontFamily: 'Swissra-Normal',
                              color: Color(0XFF232323),
                              height: 1.9,
                            ),
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person_outline,
                                color: Color(0xffe9751f),
                              ),
                              hintText: 'الإسم',
                              hintStyle: TextStyle(
                                fontFamily: 'Swissra-Normal',
                                height: 1.87,
                                color: Color(0xff8a8a8a),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xffe8ebf7), width: 1.4),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xffe8ebf7), width: 1.4),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                                borderSide: BorderSide(
                                    color: Color(0xffe8ebf7), width: 1.4),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 20),
                            ),
                          ),
                          SizedBox(height: 30),
                          TextField(
                            controller: authController.lastNameIn,
                            style: TextStyle(
                              fontFamily: 'Swissra-Normal',
                              color: Color(0XFF232323),
                              height: 1.9,
                            ),
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person_outline,
                                color: Color(0xffe9751f),
                              ),
                              hintText: 'اللقب',
                              hintStyle: TextStyle(
                                fontFamily: 'Swissra-Normal',
                                height: 1.87,
                                color: Color(0xff8a8a8a),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xffe8ebf7), width: 1.4),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xffe8ebf7), width: 1.4),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
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
                              onPressed: () => authController.signup(),
                              style: ElevatedButton.styleFrom(
                                elevation: 0.4,
                                backgroundColor: Color(0xff7886e9),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Text(
                                "إكمال التسجيل",
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
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
