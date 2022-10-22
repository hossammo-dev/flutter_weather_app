import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'core/network/api/api_services_client.dart';
import 'core/network/network_info.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
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

