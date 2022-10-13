import 'package:dio/dio.dart';

import 'api_endpoints.dart';
import 'api_status_code.dart';

class DioFactory {
  Dio get dio  {
    Dio dio = Dio();
    dio.options = BaseOptions(
        baseUrl: ApiEndPoints.baseUrl,
        responseType: ResponseType.plain,
        followRedirects: false,
        validateStatus: (status) {
          return status! < ApiStatusCode.internalServerError;
        },
        headers: {
          ApiHeaders.contentType: ApiHeaders.applicationJson,
          ApiHeaders.accept: ApiHeaders.applicationJson,
          ApiHeaders.authorization: ApiEndPoints.apiKey
        },
        receiveDataWhenStatusError: true);
    return dio;
  }
}
