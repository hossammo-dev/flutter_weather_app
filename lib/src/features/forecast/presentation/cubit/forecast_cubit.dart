import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../core/usecase/usecase_params_types.dart';
import '../../domain/use_cases/forecast_usecase.dart';
import 'forecast_states.dart';

class ForecastCubit extends Cubit<ForecastStates>{
  ForecastCubit(this._forecastByLocationUseCase) : super(ForecastInitialState());
  final ForecastByLocationUseCase _forecastByLocationUseCase;

  //get current location
  Future<CoordObject> _getCurrentLocation() async {
    emit(ForecastGetCurrentLocationLoadingState());
    try {
      await Geolocator.requestPermission();
      final location = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      emit(ForecastGetCurrentLocationSuccessState());
      return CoordObject(location.latitude, location.longitude);
    } on Exception {
      emit(ForecastGetCurrentLocationErrorState());
      return CoordObject(0, 0);
    }
  }

  //get forecast by current location
  Future<void> getForecastByCurrentLocation() async {
    emit(ForecastGetForecastLoadingState());
    final coords = await _getCurrentLocation();
    final response = await _forecastByLocationUseCase(coords);
    emit(response.fold((failure) => ForecastGetForecastErrorState(),
            (forecast) {
      // debugPrint("--forecast: $forecast");
              return ForecastGetForecastSuccessState(forecast);
            }));
  }

//get forecast by city name
}