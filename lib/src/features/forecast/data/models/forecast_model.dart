import '../../domain/entities/forecast_entity.dart';

class ForecastModel extends Forecast {
  const ForecastModel(int temp, int time, String iconCode)
      : super(temp, time, iconCode);

  static List<ForecastModel> fromJson(Map<String, dynamic> json) {
    List<ForecastModel> forecasts = [];
    json['list'].map((jsonObj) => forecasts.add(ForecastModel(
        (jsonObj['main']['temp']).round(), jsonObj['dt'], jsonObj['weather'][0]['icon']))).toList();
    return forecasts;
  }
}
