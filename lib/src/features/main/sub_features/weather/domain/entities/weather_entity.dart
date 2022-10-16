import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final String city;
  final int temp;
  final int humidity;
  final int pressure;
  final int windSpeed;
  final String condition;
  final String iconCode;
  final String countryCode;
  final DateTime time = DateTime.now();

  Weather(this.city, this.temp, this.humidity, this.pressure, this.windSpeed, this.condition,
      this.iconCode, this.countryCode);

  @override
  List<Object?> get props =>
      [city, time, temp, windSpeed, humidity, pressure, condition, iconCode, countryCode];
}
