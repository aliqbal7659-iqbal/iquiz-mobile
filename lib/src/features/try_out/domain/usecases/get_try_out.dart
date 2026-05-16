import 'package:dartz/dartz.dart';
import 'package:iquiz/src/core/common/failure.dart';
import 'package:iquiz/src/features/try_out/domain/entities/tryout.dart';
import 'package:iquiz/src/features/try_out/domain/repositories/try_out_repository.dart';

class GetTryOut {
  final TryOutRepository repository;

  GetTryOut(this.repository);

  Future<Either<Failure, List<Tryout>>> execute() {
    return repository.getTryOut();
  }
}
