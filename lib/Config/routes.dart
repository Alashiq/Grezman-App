import 'package:flutter_starter/UI/activate_screen/activate_screen.dart';
import 'package:get/get.dart';

import '../UI/login_screen/login_screen.dart';
import '../UI/splash_screen/splash_screen.dart';

final List<GetPage> routes = [
  GetPage(name: '/', page: () => const SplashScreen()),
  GetPage(name: '/login', page: () => const LoginScreen()),
  GetPage(name: '/activate', page: () => const ActivateScreen()),
  // GetPage(name: '/onboarding', page: () => const OnBoardingScreen()),
];
