part of 'try_out_bloc.dart';

sealed class TryOutEvent {}

final class TryOutDataLoaded extends TryOutEvent {}

final class TryOutDataSearched extends TryOutEvent {
  final String keyword;

  TryOutDataSearched({required this.keyword});
}
