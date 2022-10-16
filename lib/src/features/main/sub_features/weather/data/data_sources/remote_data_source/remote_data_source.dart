
import 'package:weather/src/core/functions/functions.dart';

import '../../../../../../../core/network/api/api_endpoints.dart';
import '../../../../../../../core/network/api/api_services_client.dart';
import '../../../../../../../core/usecase/usecase_params_types.dart';
import '../../models/weather_model.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherModel> getWeatherByCurrentLocation(CoordObject coordObject);
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final ApiServicesClient _apiClient;

  WeatherRemoteDataSourceImpl(this._apiClient);

  @override
  Future<WeatherModel> getWeatherByCurrentLocation(CoordObject coordObject) async {
    final params = getParams(lat: coordObject.lat, lon: coordObject.long);

    final response =
        await _apiClient.get(ApiEndPoints.weather, params: params);
    return WeatherModel.fromJson(response);
  }
}
