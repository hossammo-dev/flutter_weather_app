import 'package:get_it/get_it.dart';

import '../../core/network/api/api_services_client.dart';
import '../../core/network/network_info.dart';
import 'data/data_sources/remote_data_source/remote_data_source.dart';
import 'data/repositories/repository_impl.dart';
import 'domain/repositories/repository.dart';
import 'domain/use_cases/forecast_usecase.dart';
import 'presentation/cubit/forecast_cubit.dart';

final forecastInstance = GetIt.instance;

Future<void> initForecastModule() async {
  /// features

  //blocs
  forecastInstance.registerFactory<ForecastCubit>(() => ForecastCubit(forecastInstance<ForecastByLocationUseCase>()));

  // use cases
  forecastInstance.registerLazySingleton<ForecastByLocationUseCase>(() => ForecastByLocationUseCase(forecastInstance<ForecastRepository>()));

  // repositories
  forecastInstance.registerLazySingleton<ForecastRepository>(() => ForecastRepositoryImpl(forecastInstance<NetworkInfo>(), forecastInstance<ForecastRemoteDataSource>()));

  //data sources
  forecastInstance.registerLazySingleton<ForecastRemoteDataSource>(() => ForecastRemoteDataSourceImpl(forecastInstance<ApiServicesClient>()));
}