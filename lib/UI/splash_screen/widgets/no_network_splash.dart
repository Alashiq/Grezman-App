import 'package:flutter/material.dart';
import 'package:flutter_starter/Config/shared_preferences.dart';
import 'package:get/get.dart';

class NoNetworkSplash extends StatelessWidget {
  final Function? onInit;
  final double? height;
  const NoNetworkSplash(
      {Key? key, @required this.onInit, @required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: height,
      width: double.infinity,
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/img/no-internet.png',
              height: 180,
              width: 180,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "إنقطع الإتصال",
              style: TextStyle(
                  fontFamily: 'Swissra-Normal',
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff7886e9)),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Text(
                "نعتذر لا يتوفر اي اتصال بالإنترنت , قم بالتأكد من اتصالك بالإنترنت وحاول مجددا",
                style: TextStyle(
                  fontFamily: 'Swissra-Normal',
                  color: Color(0xff7a7a7a),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 52,
              width: 220,
              child: ElevatedButton(
                onPressed: () async {
                  if (onInit != null) {
                    await onInit!();
                  }
                },
                child: Text(
                  "إعادة تحميل",
                  style: TextStyle(
                    fontFamily: 'Swissra-Normal',
                    fontSize: 16,
                    color: Colors.white,
                    height: 2.21,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff7886e9),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              "أو",
              style: TextStyle(
                fontFamily: 'Swissra-Normal',
                color: Color(0XFF5A5A5A),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              height: 52,
              width: 220,
              child: ElevatedButton(
                onPressed: () {
                  removeString("token");
                  Get.offAllNamed("/login");
                },
                child: Text(
                  "صفحة تسجيل الدخول",
                  style: TextStyle(
                    fontFamily: 'Swissra-Normal',
                    fontSize: 16,
                    color: Colors.white,
                    height: 2.21,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff7886e9),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
