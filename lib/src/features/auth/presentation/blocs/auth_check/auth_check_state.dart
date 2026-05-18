part of 'auth_check_bloc.dart';

sealed class AuthCheckState extends Equatable {
  const AuthCheckState();

  @override
  List<Object?> get props => [];
}

final class AuthCheckInitial extends AuthCheckState {}

final class AuthCheckInProgress extends AuthCheckState {}

final class AuthUnauthenticated extends AuthCheckState {}

final class AuthAuthenticated extends AuthCheckState {
  final User? user;

  const AuthAuthenticated({required this.user});

  @override
  List<Object?> get props => [user];
}
