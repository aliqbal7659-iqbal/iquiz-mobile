import 'package:iquiz/src/features/try_out/domain/entities/tryout_question.dart';

class TryoutQuestionResponse {
  final num? id;
  final String? question;
  final String? answer;
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
      answer: json['answer'],
      discussion: json['discussion'],
    );
  }
}
