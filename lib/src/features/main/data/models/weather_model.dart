import '../../domain/entities/weather_entity.dart';

class WeatherModel extends Weather {
  WeatherModel(String city, DateTime time, int temp, int windSpeed,
      int humidity, int pressure, String icon, String countryCode)
      : super(
            city, time, temp, windSpeed, humidity, pressure, icon, countryCode);
}
