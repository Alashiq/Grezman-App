import 'package:flutter_starter/Features/Auth/Actions/activate.dart';
import 'package:flutter_starter/Features/Auth/Actions/start_the_app.dart';
import 'package:get/get.dart';

import '../../../Const/loading_status.dart';
import '../Actions/login.dart';
import '../Models/user_model.dart';

class AuthController extends GetxController
    with StartTheAppMixin, LoginMixin, ActivateMixin {
  String phone = "";

  UserModel? user = UserModel.fromJson({
    "loadState": LoadingStatus.NOT_STARTED,
  });
}
