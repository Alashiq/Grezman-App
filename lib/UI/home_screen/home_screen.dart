import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Features/Auth/Controllers/auth_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GetBuilder<AuthController>(
        builder: (authController) => Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(authController.user!.firstname!),
              Text(authController.user!.firstname!),
              Text(authController.user!.firstname!),
              Text(authController.user!.firstname!),
              Text("data"),
            ],
          ),
        ),
      ),
    );
  }
}
