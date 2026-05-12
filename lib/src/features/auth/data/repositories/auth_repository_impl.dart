import 'package:dartz/dartz.dart';
import 'package:iquiz/src/core/common/exception.dart';
import 'package:iquiz/src/core/common/failure.dart';
import 'package:iquiz/src/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:iquiz/src/features/auth/data/models/user_table.dart';
import 'package:iquiz/src/features/auth/domain/entities/user.dart';
import 'package:iquiz/src/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource localDatasource;

  AuthRepositoryImpl({required this.localDatasource});

  @override
  Future<Either<Failure, String>> login({
    required String email,
    required String password,
  }) async {
    try {
      final result = await localDatasource.loginUser(
        email: email,
        password: password,
      );
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, String>> register(User user) async {
    try {
      final result = await localDatasource.registerUser(
        UserTable.fromModel(user),
      );
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, User?>> checkAuthentication() async {
    try {
      final result = await localDatasource.checkAuthenticated();
      if (result == null) {
        return Left(DatabaseFailure("Anda terlogout"));
      }
      return Right(result.toEntity());
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }
}
