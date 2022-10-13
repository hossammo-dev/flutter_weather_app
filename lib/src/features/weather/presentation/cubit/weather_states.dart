import 'package:equatable/equatable.dart';

import '../../domain/entities/weather_entity.dart';

abstract class WeatherStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class WeatherInitialState extends WeatherStates {}

//get weather states
class WeatherGetWeatherLoadingState extends WeatherStates {}

class WeatherGetWeatherSuccessState extends WeatherStates {
  final Weather weather;

  WeatherGetWeatherSuccessState(this.weather);

  @override
  List<Object?> get props => [weather];
}

class WeatherGetWeatherErrorState extends WeatherStates {}


//get current location states
class WeatherGetCurrentLocationLoadingState extends WeatherStates {}

class WeatherGetCurrentLocationSuccessState extends WeatherStates {}

class WeatherGetCurrentLocationErrorState extends WeatherStates {}
