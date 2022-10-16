
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
    final params = {
      ApiQueries.lat : coordObject.lat,
      ApiQueries.lon : coordObject.long,
      ApiQueries.units : WeatherUnits.metric,
      ApiQueries.appId : ApiEndPoints.apiKey
    };

    final response =
        await _apiClient.get(ApiEndPoints.weather, params: params);
    return WeatherModel.fromJson(response);
  }
}
