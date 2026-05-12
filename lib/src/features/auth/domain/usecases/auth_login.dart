import 'package:dartz/dartz.dart';
import 'package:iquiz/src/core/common/failure.dart';
import 'package:iquiz/src/features/auth/domain/repositories/auth_repository.dart';

class AuthLogin {
  final AuthRepository repository;

  AuthLogin(this.repository);

  Future<Either<Failure, String>> execute({
    required String email,
    required String password,
  }) {
    return repository.login(email: email, password: password);
  }
}
