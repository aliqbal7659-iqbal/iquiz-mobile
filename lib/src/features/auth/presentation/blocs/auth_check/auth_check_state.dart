part of 'auth_check_bloc.dart';

sealed class AuthCheckState {}

final class AuthCheckInitial extends AuthCheckState {}

final class AuthUnauthenticated extends AuthCheckState {}

final class AuthAuthenticated extends AuthCheckState {
  final User? user;

  AuthAuthenticated({required this.user});
}
