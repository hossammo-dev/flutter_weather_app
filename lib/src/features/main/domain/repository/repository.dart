import 'package:dartz/dartz.dart';

import '../../../../core/network/error/failure.dart';
import '../../../../core/network/request_objects/request_objects.dart';
import '../entities/weather_entity.dart';

abstract class Repository {
  Future<Either<Failure, Weather>> getWeather(CoordObject coordObject);
}