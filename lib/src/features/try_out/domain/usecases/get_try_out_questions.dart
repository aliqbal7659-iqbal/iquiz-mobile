import 'package:dartz/dartz.dart';
import 'package:iquiz/src/core/common/failure.dart';
import 'package:iquiz/src/features/try_out/domain/entities/tryout_question.dart';
import 'package:iquiz/src/features/try_out/domain/repositories/try_out_repository.dart';

class GetTryOutQuestions {
  final TryOutRepository repository;

  GetTryOutQuestions(this.repository);

  Future<Either<Failure, List<TryoutQuestion>>> execute({
    required String fileName,
  }) {
    return repository.getTryOutQuestions(fileName: fileName);
  }
}
