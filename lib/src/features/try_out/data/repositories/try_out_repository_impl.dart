import 'package:dartz/dartz.dart';
import 'package:iquiz/src/core/common/failure.dart';
import 'package:iquiz/src/features/try_out/data/datasources/tryout_local_datasource.dart';
import 'package:iquiz/src/features/try_out/domain/entities/tryout.dart';
import 'package:iquiz/src/features/try_out/domain/entities/tryout_question.dart';
import 'package:iquiz/src/features/try_out/domain/repositories/try_out_repository.dart';

class TryOutRepositoryImpl implements TryOutRepository {
  final TryoutLocalDatasource datasource;

  TryOutRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, List<Tryout>>> getTryOut() async {
    try {
      final resp = await datasource.getTryOut();
      return Right(resp.map((item) => item.toModel()).toList());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TryoutQuestion>>> getTryOutQuestions({
    required String fileName,
  }) async {
    try {
      final resp = await datasource.getQuestion(fileName: fileName);

      return Right(resp.map((item) => item.toModel()).toList());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Tryout>>> searchTryOut({
    required String keyword,
  }) async {
    try {
      final resp = await datasource.searchTryOut(keyword: keyword);
      return Right(resp.map((item) => item.toModel()).toList());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
