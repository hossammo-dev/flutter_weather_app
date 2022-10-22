import 'package:equatable/equatable.dart';

import '../../domain/entities/forecast_entity.dart';

abstract class ForecastStates extends Equatable{
  @override
  List<Object?> get props => [];
}

class ForecastInitialState extends ForecastStates {}

//get forecast states
class ForecastGetForecastLoadingState extends ForecastStates {}

class ForecastGetForecastSuccessState extends ForecastStates {
  final List<Forecast> forecast;

  ForecastGetForecastSuccessState(this.forecast);

  @override
  List<Object?> get props => [forecast];
}

class ForecastGetForecastErrorState extends ForecastStates {}


//get current location states
class ForecastGetCurrentLocationLoadingState extends ForecastStates {}

class ForecastGetCurrentLocationSuccessState extends ForecastStates {}

class ForecastGetCurrentLocationErrorState extends ForecastStates {}
