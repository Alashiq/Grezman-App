import 'package:flutter_starter/UI/activate_screen/activate_screen.dart';
import 'package:flutter_starter/UI/home_screen/home_screen.dart';
import 'package:flutter_starter/UI/main_Items_screen/main_items_screen.dart';
import 'package:flutter_starter/UI/new_item_screen/new_item_screen.dart';
import 'package:flutter_starter/UI/notifications_screen/notifications_screen.dart';
import 'package:flutter_starter/UI/onboarding_screen.dart/onboarding_screen.dart';
import 'package:flutter_starter/UI/profile_screen/profile_screen.dart';
import 'package:flutter_starter/UI/signup_screen/signup_screen.dart';
import 'package:get/get.dart';

import '../UI/login_screen/login_screen.dart';
import '../UI/splash_screen/splash_screen.dart';

final List<GetPage> routes = [
  GetPage(name: '/', page: () => const SplashScreen()),
  GetPage(name: '/onboarding', page: () => const OnBoardingScreen()),
  GetPage(name: '/login', page: () => const LoginScreen()),
  GetPage(name: '/activate', page: () => const ActivateScreen()),
  GetPage(name: '/signup', page: () => const SignupScreen()),
  GetPage(name: '/home', page: () => const HomeScreen()),
  GetPage(name: '/profile', page: () => const ProfileScreen()),
  GetPage(name: '/main_items', page: () => const MainItemsScreen()),
  GetPage(name: '/notifications', page: () => const NotificationsScreen()),
  GetPage(name: '/new_item', page: () => const NewItemScreen()),
];
