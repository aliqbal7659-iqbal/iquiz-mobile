part of 'auth_bloc.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthInProgress extends AuthState {}

final class AuthSuccess extends AuthState {
  final String message;

  AuthSuccess({required this.message});
}

final class AuthLogOutSuccess extends AuthState {
  final String message;

  AuthLogOutSuccess({required this.message});
}

final class AuthFailure extends AuthState {
  final String message;

  AuthFailure({required this.message});
}
