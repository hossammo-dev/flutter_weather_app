import '../../domain/entities/forecast_entity.dart';

class ForecastModel extends Forecast {
  const ForecastModel(int temp, int time, String iconCode)
      : super(temp, time, iconCode);

  factory ForecastModel.fromJson(Map<String, dynamic> json) => ForecastModel(
      (json['main']['temp']).round(), json['dt'], json['weather'][0]['icon']);
}
