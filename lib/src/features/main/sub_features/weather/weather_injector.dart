import 'package:get_it/get_it.dart';

import '../../../../core/network/api/api_services_client.dart';
import '../../../../core/network/network_info.dart';
import 'data/data_sources/remote_data_source/remote_data_source.dart';
import 'data/repository/repository_impl.dart';
import 'domain/repository/repository.dart';
import 'domain/use_cases/weather_usecase.dart';
import 'presentation/cubit/weather_cubit.dart';

final weatherInstance = GetIt.instance;

Future<void> initWeatherModule() async{
  /// features

  //blocs
  weatherInstance.registerFactory<WeatherCubit>(() => WeatherCubit(weatherInstance<WeatherByLocationUseCase>()));

  // use cases
  weatherInstance.registerLazySingleton<WeatherByLocationUseCase>(() => WeatherByLocationUseCase(weatherInstance<WeatherRepository>()));

  // repositories
  weatherInstance.registerLazySingleton<WeatherRepository>(() => WeatherRepositoryImpl(weatherInstance<NetworkInfo>(), weatherInstance<WeatherRemoteDataSource>()));

  //data sources
  weatherInstance.registerLazySingleton<WeatherRemoteDataSource>(() => WeatherRemoteDataSourceImpl(weatherInstance<ApiServicesClient>()));
}