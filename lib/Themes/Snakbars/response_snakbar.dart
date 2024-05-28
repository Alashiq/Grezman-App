import 'package:flutter/material.dart';
import 'package:get/get.dart';

responseSnakbarError(int statusCode) {
  Get.snackbar(
    "",
    "",
    titleText: Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Text(
        "تنبيه",
        style: TextStyle(
          fontFamily: 'Swissra-Medium',
          color: Colors.white,
          fontSize: 17,
        ),
        textAlign: TextAlign.right,
      ),
    ),
    messageText: Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              statusCode == 204
                  ? "وصلت لنهاية القائمة"
                  : statusCode == 403
                      ? "ليس لديك الصلاحية"
                      : "حدث خطأ ما",
              style: TextStyle(
                fontFamily: 'Swissra-Normal',
                color: Colors.white,
                fontSize: 14,
              ),
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ),
    ),
    backgroundColor: Color(0xff313131),
    snackPosition: SnackPosition.BOTTOM,
  );
}
