import 'package:flutter_starter/Features/Auth/Actions/start_the_app.dart';
import 'package:get/get.dart';

import '../Actions/login.dart';

class AuthController extends GetxController with StartTheAppMixin, LoginMixin {
  String phone = "";
}
