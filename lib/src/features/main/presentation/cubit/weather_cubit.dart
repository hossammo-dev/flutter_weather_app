
import 'package:flutter_bloc/flutter_bloc.dart';

import 'weather_states.dart';

class WeatherCubit extends Cubit<WeatherStates>{
  WeatherCubit() : super(WeatherInitialState());
}