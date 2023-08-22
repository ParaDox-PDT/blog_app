import 'package:flutter/material.dart';
import 'package:flutter_defualt_project/presentation/on_boarding/on_boarding_screen.dart';
import 'package:flutter_defualt_project/presentation/splash/splash_screen.dart';


import 'home/home_screen.dart';

class RouteNames {
  static const String homeScreen = "/homeScreen";
  static const String onBoarding = "/on_boarding";
  static const String splashScreen = "/";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case RouteNames.onBoarding:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
        );
      case RouteNames.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("Route not found!"),
            ),
          ),
        );
    }
  }
}