import 'package:equatable/equatable.dart';

import '../../utils/strings_manager.dart';

class ServerException extends Equatable implements Exception {
  final String? msg;

  const ServerException([this.msg]);
  @override
  List<Object?> get props => [msg];

  @override
  String toString() => "$msg";
}

class FetchDataException extends ServerException {
  const FetchDataException([msg]) : super(ExceptionStrings.errDuringCommunication);
}

class BadRequestException extends ServerException {
  const BadRequestException([msg]) : super(ExceptionStrings.badRequest);
}

class UnauthorizedException extends ServerException {
  const UnauthorizedException([msg]) : super(ExceptionStrings.unauthorized);
}

class NotFoundException extends ServerException {
  const NotFoundException([msg]) : super(ExceptionStrings.requestInfoNotFound);
}

class ConflictException extends ServerException {
  const ConflictException([msg]) : super(ExceptionStrings.conflictOccurred);
}

class InternalServerErrorException extends ServerException {
  const InternalServerErrorException([msg]) : super(ExceptionStrings.internalServerError);
}

class NoInternetConnectionException extends ServerException {
  const NoInternetConnectionException([msg]) : super(ExceptionStrings.noInternetConnection);
}


class CacheException implements Exception {}
