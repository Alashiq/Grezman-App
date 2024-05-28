import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyBox extends StatelessWidget {
  final Function? onInit;
  final double? height;
  const EmptyBox({Key? key, @required this.onInit, @required this.height})
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
              'assets/img/empty.png',
              height: 140,
              width: 140,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "لا يوجد عناصر في القائمة",
              style: TextStyle(
                  fontFamily: 'Swissra-Normal',
                  fontSize: 21,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff7a7a7a)),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Text(
                "هذه القائمة لا تحتوي على اي عناصر حاليا",
                style: TextStyle(
                  fontFamily: 'Swissra-Normal',
                  color: Color(0xff9a9a9a),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 48,
              width: 180,
              child: ElevatedButton(
                onPressed: () async {
                  if (onInit != null) {
                    await onInit!();
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.refresh,
                      color: Colors.white,
                    ),
                    SizedBox(width: 6),
                    Text(
                      "إعادة تحميل",
                      style: GoogleFonts.cairo(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
