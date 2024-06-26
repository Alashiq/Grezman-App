import 'package:flutter_starter/Features/Auth/Actions/activate.dart';
import 'package:flutter_starter/Features/Auth/Actions/auth.dart';
import 'package:flutter_starter/Features/Auth/Actions/edit_name.dart';
import 'package:flutter_starter/Features/Auth/Actions/edit_photo.dart';
import 'package:flutter_starter/Features/Auth/Actions/logout.dart';
import 'package:flutter_starter/Features/Auth/Actions/onboarding.dart';
import 'package:flutter_starter/Features/Auth/Actions/signup.dart';
import 'package:flutter_starter/Features/Auth/Actions/start_the_app.dart';
import 'package:get/get.dart';

import '../../../Const/loading_status.dart';
import '../Actions/login.dart';
import '../Models/user_model.dart';

class AuthController extends GetxController
    with
        StartTheAppMixin,
        LoginMixin,
        ActivateMixin,
        SignupMixin,
        LogoutMixin,
        AuthMixin,
        OnBoardingMixin,
        EditNameMixin,
        EditPhotoMixin {
  String phone = "";

  UserModel? user = UserModel.fromJson({
    "loadState": LoadingStatus.IN_PROGRESS,
  });
}
