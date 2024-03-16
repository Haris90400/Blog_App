import 'package:blog_app/core/error/failures.dart';
import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/features/auth/domain/entities/user.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserLogIn implements UseCase<User, UserLogInParams> {
  final AuthRepository authRepository;

  UserLogIn(this.authRepository);
  @override
  Future<Either<Failure, User>> call(UserLogInParams parameters) async {
    return await authRepository.logInWithEmailPassword(
      email: parameters.email,
      password: parameters.password,
    );
  }
}

class UserLogInParams {
  final String email;
  final String password;

  UserLogInParams({
    required this.email,
    required this.password,
  });
}
