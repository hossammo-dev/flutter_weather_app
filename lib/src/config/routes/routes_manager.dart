import 'package:flutter/material.dart';
import 'package:weather/src/config/routes/routes_paths.dart';

import '../../core/utils/strings_manager.dart';

class RoutesManager {
  static const String splashRoute = "/";
  static const String mainRoute = "/main";
  static const String forecastRoute = "/forecast";
  static const String searchRoute = "/search";
}

class RoutesGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesManager.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());

      case RoutesManager.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainView());

      case RoutesManager.forecastRoute:
        return MaterialPageRoute(builder: (_) => const ForecastView());

      case RoutesManager.searchRoute:
        return MaterialPageRoute(builder: (_) => const SearchView());

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
