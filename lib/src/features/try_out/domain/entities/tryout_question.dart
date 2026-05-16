import 'package:equatable/equatable.dart';

class TryoutQuestion extends Equatable {
  final num? id;
  final String? question;
  final String? answer;
  final String? discussion;

  const TryoutQuestion({this.id, this.question, this.answer, this.discussion});
  @override
  List<Object?> get props => [id, question, answer, discussion];
}
