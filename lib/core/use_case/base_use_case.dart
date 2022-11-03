import 'package:dartz/dartz.dart';
import 'package:movieapp/core/error/failure.dart';

abstract class BaseUseCase<T> {

  Future<Either<Failure, T>>call();

}