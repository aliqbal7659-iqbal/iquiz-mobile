import 'package:dartz/dartz.dart';
import 'package:iquiz/src/core/common/failure.dart';
import 'package:iquiz/src/features/auth/domain/repositories/auth_repository.dart';

class AuthLogout {
  final AuthRepository repository;

  AuthLogout(this.repository);

  Future<Either<Failure, String>> execute() {
    return repository.logout();
  }
}
