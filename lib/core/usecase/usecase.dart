import 'package:blog_app/core/error/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class UseCase<SuccesType, Parameters> {
  Future<Either<Failure, SuccesType>> call(
    Parameters parameters,
  );
}
