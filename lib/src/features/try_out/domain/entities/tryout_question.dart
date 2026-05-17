import 'package:equatable/equatable.dart';
import 'package:iquiz/src/features/try_out/domain/enums/option_answer.dart';

class TryoutQuestion extends Equatable {
  final num? id;
  final String? question;
  final OptionAnswer? answer;
  final String? discussion;

  const TryoutQuestion({this.id, this.question, this.answer, this.discussion});
  @override
  List<Object?> get props => [id, question, answer, discussion];
}
