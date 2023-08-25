import 'package:flutter/material.dart';
import 'package:flutter_defualt_project/presentation/auth/auth_screen.dart';
import 'package:flutter_defualt_project/presentation/on_boarding/on_boarding_screen.dart';
import 'package:flutter_defualt_project/presentation/splash/splash_screen.dart';
import 'package:flutter_defualt_project/presentation/tab/tab_box.dart';
import 'package:flutter_defualt_project/presentation/websites/subscreen/add_website_screen.dart';

class RouteNames {
  static const String onBoarding = "/on_boarding";
  static const String tabBox = "/tab_box";
  static const String auth = "/auth";
  static const String splashScreen = "/";
  static const String addWebsite = "/add_website";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case RouteNames.addWebsite:
        return MaterialPageRoute(builder: (context) => AddWebsiteScreen());
      case RouteNames.auth:
        return MaterialPageRoute(
          builder: (context) =>  AuthScreen(isLoginPage: settings.arguments as bool),
        );
      case RouteNames.tabBox:
        return MaterialPageRoute(
          builder: (context) => const TabBoxScreen(),
        );
      case RouteNames.onBoarding:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
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