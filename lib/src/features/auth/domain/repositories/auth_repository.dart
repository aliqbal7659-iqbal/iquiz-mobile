import 'package:dartz/dartz.dart';
import 'package:iquiz/src/core/common/failure.dart';
import 'package:iquiz/src/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> register(User user);
  Future<Either<Failure, String>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, User?>> checkAuthentication();
  Future<Either<Failure, String>> logout();
}
