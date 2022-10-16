import '../../domain/entities/weather_entity.dart';

class WeatherModel extends Weather {
  WeatherModel(String city, int temp, int humidity, int pressure,
      double windSpeed, String condition, String iconCode, String countryCode)
      : super(city, temp, humidity, pressure, windSpeed, condition, iconCode,
            countryCode);

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
      json['name'],
      (json['main']['temp']).round(),
      json['main']['humidity'],
      json['main']['pressure'],
      json['wind']['speed'],
      json['weather'][0]['description'],
      json['weather'][0]['icon'],
      json['sys']['country']);
}
