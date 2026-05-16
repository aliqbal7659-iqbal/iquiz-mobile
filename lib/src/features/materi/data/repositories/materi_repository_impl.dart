import 'package:dartz/dartz.dart';
import 'package:iquiz/src/core/common/failure.dart';
import 'package:iquiz/src/features/materi/data/datasources/materi_local_datasource.dart';
import 'package:iquiz/src/features/materi/domain/entities/materi.dart';
import 'package:iquiz/src/features/materi/domain/repositories/materi_repository.dart';

class MateriRepositoryImpl implements MateriRepository {
  final MateriLocalDatasource datasource;

  MateriRepositoryImpl({required this.datasource});
  @override
  Future<Either<Failure, List<Materi>>> getMateri() async {
    try {
      final resp = await datasource.getMateri();
      return Right(resp.map((item) => item.toModel()).toList());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Materi>>> searchMateri({
    required String search,
  }) async {
    try {
      final resp = await datasource.searchMateri(search: search);
      return Right(resp.map((item) => item.toModel()).toList());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
