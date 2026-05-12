import 'package:dartz/dartz.dart';
import 'package:iquiz/src/core/common/failure.dart';
import 'package:iquiz/src/features/auth/domain/entities/user.dart';
import 'package:iquiz/src/features/auth/domain/repositories/auth_repository.dart';

class AuthCheck {
  final AuthRepository repository;

  AuthCheck(this.repository);

  Future<Either<Failure, User?>> execute() {
    return repository.checkAuthentication();
  }
}
