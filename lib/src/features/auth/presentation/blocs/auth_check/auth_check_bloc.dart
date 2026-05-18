import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iquiz/src/features/auth/domain/entities/user.dart';
import 'package:iquiz/src/features/auth/domain/usecases/auth_check.dart';

part 'auth_check_event.dart';
part 'auth_check_state.dart';

class AuthCheckBloc extends Bloc<AuthCheckEvent, AuthCheckState> {
  final AuthCheck authCheck;

  AuthCheckBloc({required this.authCheck}) : super(AuthCheckInitial()) {
    on<AuthChecked>((event, emit) async {
      emit(AuthCheckInProgress());
      await Future.delayed(const Duration(seconds: 1));
      final resp = await authCheck.execute();
      resp.fold(
        (l) => emit(AuthUnauthenticated()),
        (r) => emit(AuthAuthenticated(user: r)),
      );
    });
  }
}
