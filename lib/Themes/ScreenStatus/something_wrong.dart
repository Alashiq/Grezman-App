import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SomethingWrong extends StatelessWidget {
  final Function? onInit;
  final double? height;
  const SomethingWrong({Key? key, @required this.onInit, @required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: Color(0xffeeeeee), width: 1.2),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/img/wrong.png',
                height: 105,
                width: 105,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "حدث خطأ ما",
                style: TextStyle(
                    fontFamily: 'Swissra-Medium',
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff121212)),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Text(
                  "حدث خطأ في تحميل البيانات, أعد المحاولة",
                  style: TextStyle(
                    fontFamily: 'Swissra-Normal',
                    color: Color(0xff9a9a9a),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                height: 46,
                width: 144,
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
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(0),
                      backgroundColor: Color(0xff229bb7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
