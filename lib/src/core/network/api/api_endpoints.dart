class ApiEndPoints{
  static const String baseUrl = "https://api.openweathermap.org/data/2.5/";
  static const String apiKey = "cfbf54c9b97246e061430b9fe2d2cdbd";
  static const String weather = "weather?";
  static const String forecast = "forecast?";
}

class ApiHeaders{
  static const String contentType = "Content-Type";
  static const String applicationJson = "application/json";
  static const String authorization = "authorization";
  static const String language = "language";
  static const String accept = "accept";
}

class ApiQueries{
  static const String lat = "lat";
  static const String lon = "lon";
  static const String city = "q";
  static const String appId = "appid";
  static const String units = "units";

}

class WeatherUnits {
  static const String metric = "metric";
  static const String imperial = "imperial";
  static const String standard = "standard";
}