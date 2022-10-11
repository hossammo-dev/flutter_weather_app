import '../../../../../core/network/requests/requests.dart';
import '../../models/weather_model.dart';

abstract class RemoteDataSource{
  Future<WeatherModel> getCurrentWeather(CoordObject coordObject);
}