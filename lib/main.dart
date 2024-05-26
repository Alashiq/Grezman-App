import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'Config/app_binding.dart';
import 'Config/routes.dart';

main() async {
  await GetStorage.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      initialBinding: AppBinding(),
      getPages: routes,
    );
  }
}
