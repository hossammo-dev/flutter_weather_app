import 'package:weather/src/core/network/api/api_endpoints.dart';

import '../../../../../core/network/request_objects/request_objects.dart';
import '../../../../../core/network/api/api_services_client.dart';
import '../../models/weather_model.dart';

abstract class RemoteDataSource {
  Future<WeatherModel> getWeather(CoordObject coordObject);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final ApiServicesClient _apiClient;

  RemoteDataSourceImpl(this._apiClient);

  @override
  Future<WeatherModel> getWeather(CoordObject coordObject) async {
    final params = {
      'lat': coordObject.lat,
      'long': coordObject.long,
      'appid': ApiEndPoints.apiKey
    };

    final response =
        await _apiClient.get(ApiEndPoints.currentWeather, params: params);
    return WeatherModel.fromJson(response);
  }
}
