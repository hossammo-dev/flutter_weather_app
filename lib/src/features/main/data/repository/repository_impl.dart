import 'package:dartz/dartz.dart';

import 'package:weather/src/core/network/error/failure.dart';

import 'package:weather/src/core/network/request_objects/request_objects.dart';

import 'package:weather/src/features/main/domain/entities/weather_entity.dart';

import '../../domain/repository/repository.dart';

class RepositoryImpl implements Repository{
  @override
  Future<Either<Failure, Weather>> getWeather(CoordObject coordObject) {
    // TODO: implement getWeather
    throw UnimplementedError();
  }

}