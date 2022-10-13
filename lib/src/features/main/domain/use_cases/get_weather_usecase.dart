import 'package:dartz/dartz.dart';

import '../../../../core/network/error/failure.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../../../../core/usecase/usecase_params_types.dart';
import '../entities/weather_entity.dart';
import '../repository/repository.dart';

class GetWeatherUseCase implements BaseUseCase<Weather, CoordObject> {
  final Repository _repository;

  GetWeatherUseCase(this._repository);

  @override
  Future<Either<Failure, Weather>> call(CoordObject coordObject) async =>
      await _repository.getWeather(coordObject);
}
