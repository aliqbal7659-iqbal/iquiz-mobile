import 'package:dartz/dartz.dart';
import 'package:iquiz/src/core/common/failure.dart';
import 'package:iquiz/src/features/materi/domain/entities/materi.dart';
import 'package:iquiz/src/features/materi/domain/repositories/materi_repository.dart';

class SearchMateri {
  final MateriRepository repository;

  SearchMateri(this.repository);

  Future<Either<Failure, List<Materi>>> execute({
    required String search,
  }) async {
    return repository.searchMateri(search: search);
  }
}
