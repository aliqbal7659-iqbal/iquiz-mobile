import 'package:dartz/dartz.dart';
import 'package:iquiz/src/core/common/failure.dart';
import 'package:iquiz/src/features/materi/domain/entities/modul.dart';
import 'package:iquiz/src/features/materi/domain/repositories/modul_repository.dart';

class GetModul {
  final ModulRepository repository;

  GetModul(this.repository);

  Future<Either<Failure, List<Modul>>> execute({
    required String fileName,
  }) async {
    return repository.getModul(fileName: fileName);
  }
}
