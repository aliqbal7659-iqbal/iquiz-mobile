part of 'try_out_question_bloc.dart';

sealed class TryOutQuestionEvent {}

final class TryOutQuestionLoaded extends TryOutQuestionEvent {
  final String fileName;

  TryOutQuestionLoaded({required this.fileName});
}
