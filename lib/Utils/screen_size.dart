import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

screenHeight(BuildContext context, double val) {
  return MediaQuery.of(context).size.height -
      MediaQuery.of(context).padding.top -
      val;
}
