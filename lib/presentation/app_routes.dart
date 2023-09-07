import 'package:flutter/material.dart';
import 'package:flutter_defualt_project/data/models/article/article_model.dart';
import 'package:flutter_defualt_project/data/models/websites/websites_model.dart';
import 'package:flutter_defualt_project/presentation/auth/auth_screen.dart';
import 'package:flutter_defualt_project/presentation/on_boarding/on_boarding_screen.dart';
import 'package:flutter_defualt_project/presentation/splash/splash_screen.dart';
import 'package:flutter_defualt_project/presentation/tab/articles/subscreens/article_add_screen.dart';
import 'package:flutter_defualt_project/presentation/tab/articles/subscreens/article_detail_screen.dart';
import 'package:flutter_defualt_project/presentation/tab/tab_box.dart';
import 'package:flutter_defualt_project/presentation/tab/websites/subscreen/add_website_screen.dart';
import 'package:flutter_defualt_project/presentation/tab/websites/subscreen/website_detail_screen.dart';

class RouteNames {
  static const String onBoarding = "/on_boarding";
  static const String tabBox = "/tab_box";
  static const String auth = "/auth";
  static const String splashScreen = "/";
  static const String addWebsite = "/add_website";
  static const String websiteDetail = "/website_detail";
  static const String articleDetail = "/article_detail";
  static const String articleAdd = "/article_add";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case RouteNames.articleAdd:
        return MaterialPageRoute(
          builder: (context) => const ArticleAddScreen(),
        );
      case RouteNames.articleDetail:
        return MaterialPageRoute(builder: (context) => ArticleDetailScreen(articleModel: settings.arguments as ArticleModel));
      case RouteNames.websiteDetail:
        return MaterialPageRoute(builder: (context) => WebsiteDetailScreen(websiteModel: settings.arguments as WebsiteModel));
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