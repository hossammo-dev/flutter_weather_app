import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/src/core/usecase/usecase_params_types.dart';

import '../../domain/use_cases/weather_usecase.dart';
import 'weather_states.dart';

class WeatherCubit extends Cubit<WeatherStates> {
  WeatherCubit(this._weatherByLocationUseCase) : super(WeatherInitialState());
  final WeatherByLocationUseCase _weatherByLocationUseCase;

  //get current location
  Future<CoordObject> _getCurrentLocation() async {
    emit(WeatherGetCurrentLocationLoadingState());
    try {
      await Geolocator.requestPermission();
      final location = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      emit(WeatherGetCurrentLocationSuccessState());
      return CoordObject(location.latitude, location.longitude);
    } on Exception {
      emit(WeatherGetCurrentLocationErrorState());
      return CoordObject(0, 0);
    }
  }

  //get weather by current location
  Future<void> getWeatherByCurrentLocation() async {
    emit(WeatherGetWeatherLoadingState());
    final coords = await _getCurrentLocation();
    final response = await _weatherByLocationUseCase(coords);
    emit(response.fold((failure) => WeatherGetWeatherErrorState(),
        (weather) => WeatherGetWeatherSuccessState(weather)));
  }

  //get weather by city name
}
