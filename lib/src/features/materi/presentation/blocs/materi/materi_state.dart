part of 'materi_bloc.dart';

sealed class MateriState {}

final class MateriInitial extends MateriState {}

final class MateriInProgress extends MateriState {}

final class MateriSuccess extends MateriState {
  final List<Materi> data;

  MateriSuccess({required this.data});
}

final class MateriFailure extends MateriState {
  final String message;

  MateriFailure({required this.message});
}
