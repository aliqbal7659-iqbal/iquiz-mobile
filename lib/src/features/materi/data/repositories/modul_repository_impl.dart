import 'package:dartz/dartz.dart';
import 'package:iquiz/src/core/common/failure.dart';
import 'package:iquiz/src/features/materi/data/datasources/modul_local_datasource.dart';
import 'package:iquiz/src/features/materi/domain/entities/modul.dart';
import 'package:iquiz/src/features/materi/domain/repositories/modul_repository.dart';

class ModulRepositoryImpl implements ModulRepository {
  final ModulLocalDatasource datasource;

  ModulRepositoryImpl({required this.datasource});
  @override
  Future<Either<Failure, List<Modul>>> getModul({
    required String fileName,
  }) async {
    try {
      final resp = await datasource.getModul(fileName: fileName);
      return Right(resp.map((item) => item.toModel()).toList());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
