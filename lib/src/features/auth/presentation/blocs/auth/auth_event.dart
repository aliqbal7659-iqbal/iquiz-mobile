part of 'auth_bloc.dart';

sealed class AuthEvent {}

final class AuthLoggedIn extends AuthEvent {
  final String email;
  final String password;

  AuthLoggedIn({required this.email, required this.password});
}

final class AuthRegistered extends AuthEvent {
  final User user;

  AuthRegistered(this.user);
}
