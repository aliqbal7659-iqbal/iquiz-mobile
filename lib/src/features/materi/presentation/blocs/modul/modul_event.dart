part of 'modul_bloc.dart';

sealed class ModulEvent {}

final class ModulDataLoaded extends ModulEvent {
  final String fileName;

  ModulDataLoaded({required this.fileName});
}
