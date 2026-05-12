import 'package:dartz/dartz.dart';
import 'package:iquiz/src/core/common/failure.dart';
import 'package:iquiz/src/features/auth/domain/entities/user.dart';
import 'package:iquiz/src/features/auth/domain/repositories/auth_repository.dart';

class AuthRegister {
  final AuthRepository repository;

  AuthRegister(this.repository);

  Future<Either<Failure, String>> execute({required User user}) {
    return repository.register(user);
  }
}
