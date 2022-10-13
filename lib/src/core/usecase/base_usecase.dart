import 'package:dartz/dartz.dart';

import '../network/error/failure.dart';

abstract class BaseUseCase<Output, Input>{
  Future<Either<Failure, Output>> call(Input input);
}