part of 'auth_check_bloc.dart';

sealed class AuthCheckEvent extends Equatable {}

final class AuthChecked extends AuthCheckEvent {
  final bool isFromSplash;

  AuthChecked({this.isFromSplash = false});

  @override
  List<Object?> get props => [isFromSplash];
}
