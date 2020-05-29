import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/ui/error/error_page.dart';
import 'package:movie_app/ui/landing/landing_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final dynamic args = settings.arguments;

    switch (settings.name) {
      case AppRoutes.landingPage:
        return MaterialPageRoute(builder: (_) => LandingPage());
      case AppRoutes.error:
        return _errorRoute(args);
      default:
        return _errorRoute(args);
    }
  }

  static Route<dynamic> _errorRoute(String args) {
    return MaterialPageRoute(builder: (_) {
      if (args == null) {
        args = 'Error';
      }
      return ErrorPage(message: args);
    });
  }
}

class AppRoutes {
  static const String landingPage = 'landingPage';
  static const String error = 'error';
}
