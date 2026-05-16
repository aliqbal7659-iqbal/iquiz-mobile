import 'package:dartz/dartz.dart';
import 'package:iquiz/src/core/common/failure.dart';
import 'package:iquiz/src/features/materi/domain/entities/materi.dart';

abstract class MateriRepository {
  Future<Either<Failure, List<Materi>>> getMateri();
  Future<Either<Failure, List<Materi>>> searchMateri({required String search});
}
