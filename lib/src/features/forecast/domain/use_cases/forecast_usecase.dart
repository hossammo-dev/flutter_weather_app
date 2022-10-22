import 'package:dartz/dartz.dart';

import 'package:weather/src/core/network/error/failure.dart';

import '../../../../core/usecase/base_usecase.dart';
import '../../../../core/usecase/usecase_params_types.dart';
import '../entities/forecast_entity.dart';
import '../repositories/repository.dart';

class ForecastByLocationUseCase implements BaseUseCase<List<Forecast>, CoordObject> {
  final ForecastRepository _repository;

  ForecastByLocationUseCase(this._repository);

  @override
  Future<Either<Failure, List<Forecast>>> call(CoordObject coordObject) async =>
      await _repository.getForecastByLocation(coordObject);
}
