import 'package:flutter/material.dart';
import 'package:flutter_starter/Themes/Alerts/alertMessage.dart';
import 'package:flutter_starter/Themes/Alerts/successMessage.dart';
import 'package:flutter_starter/Utils/logout.dart';
import 'package:get/get.dart';

import '../../Features/Auth/Controllers/auth_controller.dart';
import '../../Themes/Widgets/back_layout.dart';

class RemoveAccountScreen extends StatelessWidget {
  const RemoveAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackLayout(
      title: 'حذف حسابي',
      child: GetBuilder<AuthController>(
        builder: (AuthController) => SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 120),
            const Text(
              "حذف حسابي",
              style: TextStyle(fontSize: 22, fontFamily: 'Swissra-Medium'),
            ),
            const SizedBox(height: 10),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: const Text(
                "هل أنت متأكد من أنك تريد حذف حسابك ؟",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Swissra-Normal',
                  color: Color(0xff5a5a5a),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 16),
            Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: const Text(
                "في حالة قررت حذف حسابك, سيتم اغلاق حسابك لفترة 30 يوما, إذا لم تقم بعمل تسجيل دخول خلال هذه الفترة سيتم حذف حسابك بشكل نهائي, أما اذا قمت بعمل تسجيل دخول خلال هذه الفترة سيتم استرجاع بياناتك وإلغاء قرار الحذف",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Swissra-Normal',
                  color: Color(0xff5a5a5a),
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(height: 16),
            Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: const Text(
                "إذا تم حذف حسابك وقمت بالدخول برقم هاتفك سيتم تسجيلك بشكل جديد وستفقد كل بياناتك السابقة من سجل الطلبات والنقاط المكتسبة خلال تلك الفترة.",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Swissra-Normal',
                  color: Color(0xff5a5a5a),
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(height: 30),
            RemoveAccountBtn()
          ],
        )),
      ),
    );
  }
}

class RemoveAccountBtn extends StatelessWidget {
  const RemoveAccountBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 52,
      margin: const EdgeInsets.only(right: 20, left: 20, bottom: 28),
      child: GetBuilder<AuthController>(
        builder: (controller) => TextButton(
          onPressed: () async {
            await Logout().logout();
            showAlertMessage("تم البدءي في عملية حذف الحساب");
          },
          style: TextButton.styleFrom(
            backgroundColor: Color(0xFF52575f),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16))),
          ),
          child: const Text(
            "تأكيد الحذف",
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Swissra-Normal',
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
