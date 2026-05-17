import 'package:equatable/equatable.dart';
import 'package:iquiz/src/features/try_out/domain/enums/option_answer.dart';

class TryoutAnswer extends Equatable {
  final num questionId;
  final String questions;
  final String discussion;
  final bool isCorrect;
  final OptionAnswer correctAnswer;
  final OptionAnswer userAnswer;

  const TryoutAnswer({
    required this.questionId,
    required this.questions,
    required this.discussion,
    required this.isCorrect,
    required this.correctAnswer,
    required this.userAnswer,
  });

  TryoutAnswer copyWith({
    num? questionId,
    String? questions,
    String? discussion,
    bool? isCorrect,
    OptionAnswer? correctAnswer,
    OptionAnswer? userAnswer,
  }) {
    return TryoutAnswer(
      questionId: questionId ?? this.questionId,
      questions: questions ?? this.questions,
      discussion: discussion ?? this.discussion,
      isCorrect: isCorrect ?? this.isCorrect,
      correctAnswer: correctAnswer ?? this.correctAnswer,
      userAnswer: userAnswer ?? this.userAnswer,
    );
  }

  @override
  List<Object?> get props => [
    questionId,
    questions,
    discussion,
    isCorrect,
    correctAnswer,
    userAnswer,
  ];
}
