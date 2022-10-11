import 'package:dio/dio.dart';
import 'package:weather/src/core/network/api/api_status_code.dart';
import 'package:weather/src/core/network/error/exception.dart';

class DioErrorHandler {
  static void handle(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw const FetchDataException();
      case DioErrorType.response:
        switch (error.response?.statusCode) {
          case ApiStatusCode.badRequest:
            throw const BadRequestException();
          case ApiStatusCode.unauthorized:
          case ApiStatusCode.forbidden:
            throw const UnauthorizedException();
          case ApiStatusCode.notFound:
            throw const NotFoundException();
          case ApiStatusCode.conflict:
            throw const ConflictException();
          case ApiStatusCode.internalServerError:
            throw const InternalServerErrorException();
        }
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.other:
        throw const NoInternetConnectionException();
    }
  }
}
