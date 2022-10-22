
import '../../../../../core/functions/functions.dart';
import '../../../../../core/network/api/api_endpoints.dart';
import '../../../../../core/network/api/api_services_client.dart';
import '../../../../../core/usecase/usecase_params_types.dart';
import '../../models/forecast_model.dart';

abstract class ForecastRemoteDataSource {
  Future<List<ForecastModel>> getForecastByLocation(CoordObject coordObject);
}

class ForecastRemoteDataSourceImpl implements ForecastRemoteDataSource {
  final ApiServicesClient _apiClient;

  ForecastRemoteDataSourceImpl(this._apiClient);

  @override
  Future<List<ForecastModel>> getForecastByLocation(CoordObject coordObject) async{
    final params = getParams(lat: coordObject.lat, lon: coordObject.long);
    
    final response = await _apiClient.get(ApiEndPoints.forecast, params: params);
    return ForecastModel.fromJson(response);
  }
}
