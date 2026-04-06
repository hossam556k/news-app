import 'package:flutter/material.dart';
import 'package:newsapp/core/page_route_name.dart';
import 'package:newsapp/pages/home/home.dart';
import 'package:newsapp/pages/splash/splash_view.dart';

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteNames.initial:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
          settings: settings,
        );

      case PageRouteNames.home:
        return MaterialPageRoute(
          builder: (context) => const Home(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(builder: (context) => const SplashView());
    }
  }
}
