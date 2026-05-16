import 'package:dartz/dartz.dart';
import 'package:iquiz/src/core/common/failure.dart';
import 'package:iquiz/src/features/materi/domain/entities/modul.dart';

abstract class ModulRepository {
  Future<Either<Failure, List<Modul>>> getModul({required String fileName});
}
