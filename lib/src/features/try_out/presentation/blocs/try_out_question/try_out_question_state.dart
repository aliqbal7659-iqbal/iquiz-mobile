part of 'try_out_question_bloc.dart';

sealed class TryOutQuestionState {}

final class TryOutQuestionInitial extends TryOutQuestionState {}

final class TryOutQuestionInProgress extends TryOutQuestionState {}

final class TryOutQuestionSuccess extends TryOutQuestionState {
  final List<TryoutQuestion> data;

  TryOutQuestionSuccess({required this.data});
}

final class TryOutQuestionFailure extends TryOutQuestionState {
  final String message;

  TryOutQuestionFailure({required this.message});
}
