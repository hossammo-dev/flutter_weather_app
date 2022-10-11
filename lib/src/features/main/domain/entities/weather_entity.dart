import 'package:equatable/equatable.dart';

class Weather extends Equatable{
  final String? city;
  final DateTime time;
  final int temp;
  final int windSpeed;
  final int humidity;
  final int pressure;
  final String icon;
  final String countryCode;

  const Weather(this.city, this.time, this.temp, this.windSpeed, this.humidity, this.pressure, this.icon, this.countryCode);

  @override
  List<Object?> get props => [city, time, temp, windSpeed, humidity, pressure, icon, countryCode];
}