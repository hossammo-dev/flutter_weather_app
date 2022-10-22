import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/bloc_observer.dart';


import 'app.dart';
import 'src/base_injector.dart';
import 'src/features/forecast/forecast_injector.dart';
import 'src/features/main/sub_features/weather/weather_injector.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await initAppModule();
  await initWeatherModule();
  await initForecastModule();
  runApp(const WeatherApp());
}