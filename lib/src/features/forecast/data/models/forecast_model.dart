import '../../domain/entities/forecast_entity.dart';

class ForecastModel extends Forecast {
  const ForecastModel(int temp, int time, String iconCode)
      : super(temp, time, iconCode);

  factory ForecastModel.fromJson(Map<String, dynamic> json) => json['list'].map((jsonObj) => ForecastModel(
        (jsonObj['main']['temp']).round(), jsonObj['dt'], jsonObj['weather'][0]['icon']));
}
