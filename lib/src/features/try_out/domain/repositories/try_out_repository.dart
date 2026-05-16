import 'package:dartz/dartz.dart';
import 'package:iquiz/src/core/common/failure.dart';
import 'package:iquiz/src/features/try_out/domain/entities/tryout.dart';
import 'package:iquiz/src/features/try_out/domain/entities/tryout_question.dart';

abstract class TryOutRepository {
  Future<Either<Failure, List<Tryout>>> getTryOut();
  Future<Either<Failure, List<Tryout>>> searchTryOut({required String keyword});
  Future<Either<Failure, List<TryoutQuestion>>> getTryOutQuestions({
    required String fileName,
  });
}
