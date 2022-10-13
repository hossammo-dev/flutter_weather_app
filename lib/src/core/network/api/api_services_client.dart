import 'package:dio/dio.dart';
import 'package:weather/src/core/network/api/api_consumer.dart';
import 'package:weather/src/core/network/api/dio_error_handler.dart';
import 'package:weather/src/core/network/api/dio_factory.dart';

import 'json_handler.dart';

class ApiServicesClient implements ApiConsumer {
  final Dio _dio = DioFactory().dio;

  @override
  Future get(String path, {Map<String, dynamic>? params}) async {
    try {
      final response = await _dio.get(path, queryParameters: params);
      return JsonHandler.decodeJson(response.data.toString());
    } on DioError catch (error) {
      DioErrorHandler.handle(error);
    }
  }

  @override
  Future post(String path,
      {Map<String, dynamic>? data, Map<String, dynamic>? params}) async {
    try{
      final response = await _dio.post(path, data: data, queryParameters: params);
      return JsonHandler.decodeJson(response.data.toString());
    }on DioError catch(error){
      DioErrorHandler.handle(error);
    }
  }

}
