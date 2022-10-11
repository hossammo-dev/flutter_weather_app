import 'package:flutter/material.dart';
import 'package:weather/src/core/utils/strings_manager.dart';

import 'src/config/routes/routes_manager.dart';
import 'src/config/theme/app_theme.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      onGenerateRoute: RoutesGenerator.getRoute,
    );
  }
}
