part of 'modul_bloc.dart';

sealed class ModulState {}

final class ModulInitial extends ModulState {}

final class ModulInProgress extends ModulState {}

final class ModulSuccess extends ModulState {
  final List<Modul> data;

  ModulSuccess({required this.data});
}

final class ModulFailure extends ModulState {
  final String message;

  ModulFailure({required this.message});
}
