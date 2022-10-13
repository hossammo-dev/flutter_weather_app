import 'package:dartz/dartz.dart';

import '../../../../core/network/error/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/network/request_objects/request_objects.dart';
import '../../domain/entities/weather_entity.dart';
import '../../domain/repository/repository.dart';
import '../data_sources/remote_data_source/remote_data_source.dart';

class RepositoryImpl implements Repository{
  final NetworkInfo _networkInfo;
  final RemoteDataSource _remoteDataSource;
  RepositoryImpl(this._networkInfo, this._remoteDataSource);

  @override
  Future<Either<Failure, Weather>> getWeather(CoordObject coordObject) async {
    if(await _networkInfo.isConnected){
      try{
        final response = await _remoteDataSource.getWeather(coordObject);
        //save data to cache
        return Right(response);
      } on ServerFailure {
        return Left(ServerFailure());
      }
    }else{
      //get data from local
    }
    throw UnimplementedError();
  }

}