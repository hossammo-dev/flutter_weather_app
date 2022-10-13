import 'package:weather/src/core/network/api/api_endpoints.dart';

import '../../../../../core/network/api/api_services_client.dart';
import '../../../../../core/usecase/usecase_params_types.dart';
import '../../models/weather_model.dart';

abstract class RemoteDataSource {
  Future<WeatherModel> getWeatherByCurrentLocation(CoordObject coordObject);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final ApiServicesClient _apiClient;

  RemoteDataSourceImpl(this._apiClient);

  @override
  Future<WeatherModel> getWeatherByCurrentLocation(CoordObject coordObject) async {
    final params = {
      'lat': coordObject.lat,
      'long': coordObject.long,
      'appid': ApiEndPoints.apiKey
    };

    final response =
        await _apiClient.get(ApiEndPoints.weather, params: params);
    return WeatherModel.fromJson(response);
  }
}
