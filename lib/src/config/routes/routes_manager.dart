import 'package:flutter/material.dart';
import 'package:weather/src/config/routes/routes_paths.dart';

import '../../core/utils/strings_manager.dart';

class RoutesManager {
  static const String splashRoute = "/";
  static const String mainRoute = "/main";
  static const String forecastRoute = "/forecast";
}

class RoutesGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesManager.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());

      case RoutesManager.mainRoute:
        return MaterialPageRoute(builder: (_) => MainView());

      case RoutesManager.forecastRoute:
        return MaterialPageRoute(builder: (_) => const ForecastView());

      default:
        return _undefinedRoute();
    }
  }

  static Route<dynamic> _undefinedRoute() => MaterialPageRoute(
    builder: (_) => const Scaffold(
      body: Center(
        child: Text(AppStrings.noRouteFound),
      ),
    ),
  );
}
