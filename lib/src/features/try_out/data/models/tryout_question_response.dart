import 'package:iquiz/src/features/try_out/domain/entities/tryout_question.dart';
import 'package:iquiz/src/features/try_out/domain/enums/option_answer.dart';

class TryoutQuestionResponse {
  final num? id;
  final String? question;
  final OptionAnswer? answer;
  final String? discussion;

  TryoutQuestionResponse({
    this.id,
    this.question,
    this.answer,
    this.discussion,
  });

  TryoutQuestion toModel() {
    return TryoutQuestion(
      id: id,
      question: question,
      answer: answer,
      discussion: discussion,
    );
  }

  factory TryoutQuestionResponse.fromJson(Map<String, dynamic> json) {
    return TryoutQuestionResponse(
      id: json['id'],
      question: json['question'],
      answer: _parseAnswer(json['answer']),
      discussion: json['discussion'],
    );
  }

  static OptionAnswer _parseAnswer(String? json) {
    if (json == null) return OptionAnswer.none;
    return OptionAnswer.values.firstWhere(
      (e) => e.name.toUpperCase() == json.toUpperCase(),
      orElse: () => OptionAnswer.none,
    );
  }
}
