import 'package:firebase_cubit/features/home/home_screen.dart';
import 'package:firebase_cubit/features/onboarding/onboarding_screen.dart';
import 'package:firebase_cubit/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const splash = '/';
  static const intro = '/intro';
  static const home = '/home';

  static Route routes(RouteSettings settings) {
    MaterialPageRoute buildRoute(Widget widget) {
      return MaterialPageRoute(builder: (_) => widget, settings: settings);
    }

    switch (settings.name) {
      case splash:
        return buildRoute(const SplashScreen());
      case intro:
        return buildRoute(const OnBoardingScreen());
      case home:
        return buildRoute(const HomeScreen());
      default:
        throw Exception('Routes does not exists');
    }
  }
}
