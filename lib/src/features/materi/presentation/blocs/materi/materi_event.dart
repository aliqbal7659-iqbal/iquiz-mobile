part of 'materi_bloc.dart';

sealed class MateriEvent {}

final class MateriDataLoaded extends MateriEvent {}

final class MateriDataSearched extends MateriEvent {
  final String searched;

  MateriDataSearched({required this.searched});
}
