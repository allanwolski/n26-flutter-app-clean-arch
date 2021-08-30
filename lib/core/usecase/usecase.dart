import 'package:dartz/dartz.dart';
import 'package:n26/core/errors/exceptions.dart';

abstract class Usecase<Output, Input> {
  Future<Either<Failure, Output>> call(Input params);
}
