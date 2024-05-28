import 'package:flutter_starter/Features/Auth/Actions/activate.dart';
import 'package:flutter_starter/Features/Auth/Actions/auth.dart';
import 'package:flutter_starter/Features/Auth/Actions/logout.dart';
import 'package:flutter_starter/Features/Auth/Actions/onboarding.dart';
import 'package:flutter_starter/Features/Auth/Actions/signup.dart';
import 'package:flutter_starter/Features/Auth/Actions/start_the_app.dart';
import 'package:flutter_starter/Features/Item/Actions/load_items.dart';
import 'package:get/get.dart';

import '../../../Const/loading_status.dart';

class ItemController extends GetxController with LoadItemsMixin {}
