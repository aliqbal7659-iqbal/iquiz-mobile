part of 'auth_check_bloc.dart';

sealed class AuthCheckEvent {}

final class AuthChecked extends AuthCheckEvent {
  final bool isFromSplash;

  AuthChecked({this.isFromSplash = false});
}
