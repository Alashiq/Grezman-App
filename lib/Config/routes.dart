import 'package:flutter_starter/UI/activate_screen/activate_screen.dart';
import 'package:flutter_starter/UI/home_screen/home_screen.dart';
import 'package:flutter_starter/UI/profile_screen/profile_screen.dart';
import 'package:flutter_starter/UI/signup_screen/signup_screen.dart';
import 'package:get/get.dart';

import '../UI/login_screen/login_screen.dart';
import '../UI/splash_screen/splash_screen.dart';

final List<GetPage> routes = [
  GetPage(name: '/', page: () => const SplashScreen()),
  GetPage(name: '/login', page: () => const LoginScreen()),
  GetPage(name: '/activate', page: () => const ActivateScreen()),
  GetPage(name: '/signup', page: () => const SignupScreen()),
  GetPage(name: '/home', page: () => const HomeScreen()),
  GetPage(name: '/profile', page: () => const ProfileScreen()),
];
