import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackAppBar extends StatelessWidget {
  final String title;
  const BackAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: Color(0xffefefef)))),
      child: Container(
        margin: EdgeInsets.fromLTRB(20, 50, 20, 4),
        height: 50,
        child: Row(
          children: [
            InkWell(
              onTap: () => Get.back(),
              child: Container(
                height: 50,
                width: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  // border: Border.all(
                  //   color: Color(0xffefefef),
                  // ),
                ),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 22,
                  color: Color(0xff565656),
                ),
                //color: Colors.orange,
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                //color: Colors.blue,
                child: Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Swissra-Normal',
                    fontSize: 18,
                    height: 2.455,
                  ),
                ),
              ),
            ),
            Container(
              height: 50,
              width: 50,
              //  color: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }
}
