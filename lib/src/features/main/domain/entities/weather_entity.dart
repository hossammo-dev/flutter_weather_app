class Weather{
  final String? city;
  final DateTime time;
  final int temp;
  final int windSpeed;
  final int humidity;
  final int pressure;
  final String icon;
  final String countryCode;

  Weather(this.city, this.time, this.temp, this.windSpeed, this.humidity, this.pressure, this.icon, this.countryCode);
}