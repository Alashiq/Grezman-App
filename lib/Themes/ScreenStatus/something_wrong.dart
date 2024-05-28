import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Utils/color_list.dart';

class SomethingWrong extends StatelessWidget {
  final Function? onInit;
  final double? height;
  const SomethingWrong({Key? key, @required this.onInit, @required this.height})
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
              'assets/img/wrong.png',
              height: 120,
              width: 120,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "حدث خطأ ما",
              style: TextStyle(
                  fontFamily: 'Swissra-Normal',
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Color(0xffffca54)),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Text(
                "حدث خطأ ما الرجاء إعادة المحاولة",
                style: TextStyle(
                  fontFamily: 'Swissra-Normal',
                  color: Color(0xff7a7a7a),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 52,
              width: 160,
              child: ElevatedButton(
                onPressed: () async {
                  if (onInit != null) {
                    await onInit!();
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.refresh),
                    SizedBox(width: 6),
                    Text(
                      "إعادة تحميل",
                      style: GoogleFonts.cairo(
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.BASE_BUTTON.color,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
