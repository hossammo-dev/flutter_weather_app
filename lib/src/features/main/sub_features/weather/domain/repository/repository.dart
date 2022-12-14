import 'package:dartz/dartz.dart';

import '../../../../../../core/network/error/failure.dart';
import '../../../../../../core/usecase/usecase_params_types.dart';
import '../entities/weather_entity.dart';

abstract class WeatherRepository {
  Future<Either<Failure, Weather>> getWeatherByCurrentLocation(CoordObject coordObject);
}