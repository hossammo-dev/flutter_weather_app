import 'package:dartz/dartz.dart';

import 'package:weather/src/core/network/error/failure.dart';

import 'package:weather/src/core/usecase/usecase_params_types.dart';

import 'package:weather/src/features/forecast/domain/entities/forecast_entity.dart';

import '../../../../core/network/error/exception.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/repository.dart';
import '../data_sources/remote_data_source/remote_data_source.dart';

class ForecastRepositoryImpl implements ForecastRepository{
  final NetworkInfo _networkInfo;
  final ForecastRemoteDataSource _remoteDataSource;

  ForecastRepositoryImpl(this._networkInfo, this._remoteDataSource);

  @override
  Future<Either<Failure, List<Forecast>>> getForecastByLocation(CoordObject coordObject) async {
    if(await _networkInfo.isConnected){
      try{
        final response = await _remoteDataSource.getForecastByLocation(coordObject);
        return Right(response);
      }on ServerFailure{
        return Left(ServerFailure());
      }
    }else{
      //get data from local data source
      throw const NoInternetConnectionException();
    }
  }
}