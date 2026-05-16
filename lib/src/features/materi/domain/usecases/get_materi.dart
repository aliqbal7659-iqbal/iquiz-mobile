import 'package:dartz/dartz.dart';
import 'package:iquiz/src/core/common/failure.dart';
import 'package:iquiz/src/features/materi/domain/entities/materi.dart';
import 'package:iquiz/src/features/materi/domain/repositories/materi_repository.dart';

class GetMateri {
  final MateriRepository repository;

  GetMateri(this.repository);

  Future<Either<Failure, List<Materi>>> execute() async {
    return repository.getMateri();
  }
}
