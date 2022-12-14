import '../network/api/api_endpoints.dart';

///a method to get all weather api parameters
Map<String, dynamic> getParams({double? lat, double? lon, String? cityName}) => {
  ApiQueries.lat : lat ?? 0.0,
  ApiQueries.lon : lon ?? 0.0,
  ApiQueries.city : cityName ?? "",
  ApiQueries.units : WeatherUnits.metric,
  ApiQueries.appId : ApiEndPoints.apiKey
};