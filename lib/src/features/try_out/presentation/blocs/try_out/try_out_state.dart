part of 'try_out_bloc.dart';

sealed class TryOutState {}

final class TryOutInitial extends TryOutState {}

final class TryOutInProgress extends TryOutState {}

final class TryOutSuccess extends TryOutState {
  final List<Tryout> data;

  TryOutSuccess({required this.data});
}

final class TryOutFailure extends TryOutState {
  final String message;

  TryOutFailure({required this.message});
}
