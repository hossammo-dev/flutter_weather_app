import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'core/network/api/api_services_client.dart';
import 'core/network/network_info.dart';
import 'features/main/sub_features/weather/data/data_sources/remote_data_source/remote_data_source.dart';
import 'features/main/sub_features/weather/data/repository/repository_impl.dart';
import 'features/main/sub_features/weather/domain/repository/repository.dart';
import 'features/main/sub_features/weather/domain/use_cases/weather_usecase.dart';
import 'features/main/sub_features/weather/presentation/cubit/weather_cubit.dart';

final instance = GetIt.instance;

Future<void> intiAppModule() async {
  /// features

  //blocs
  instance.registerFactory<WeatherCubit>(() => WeatherCubit(instance<WeatherByLocationUseCase>()));

  // use cases
  instance.registerLazySingleton<WeatherByLocationUseCase>(() => WeatherByLocationUseCase(instance<Repository>()));

  // repositories
  instance.registerLazySingleton<Repository>(() => RepositoryImpl(instance<NetworkInfo>(), instance<RemoteDataSource>()));

  //data sources
  instance.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(instance<ApiServicesClient>()));

  /// core
  instance.registerLazySingleton<ApiServicesClient>(() => ApiServicesClient());
  instance.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(instance<InternetConnectionChecker>()));
  // app prefs

  /// external
  instance.registerLazySingleton<InternetConnectionChecker>(() => InternetConnectionChecker());
  // shared prefs
  // hive
  // log interceptor
  // api interceptors
}

