import 'package:dartz/dartz.dart';

import '../../../../core/network/error/failure.dart';
import '../../../../core/usecase/usecase_params_types.dart';
import '../entities/forecast_entity.dart';

abstract class ForecastRepository{
  Future<Either<Failure, List<Forecast>>> getForecastByLocation(CoordObject coordObject);
}