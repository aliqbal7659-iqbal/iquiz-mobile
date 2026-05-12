import 'package:bloc/bloc.dart';
import 'package:iquiz/src/features/auth/domain/entities/user.dart';
import 'package:iquiz/src/features/auth/domain/usecases/auth_login.dart';
import 'package:iquiz/src/features/auth/domain/usecases/auth_logout.dart';
import 'package:iquiz/src/features/auth/domain/usecases/auth_register.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthLogin authLogin;
  final AuthRegister authRegister;
  final AuthLogout authLogout;

  AuthBloc({
    required this.authLogin,
    required this.authRegister,
    required this.authLogout,
  }) : super(AuthInitial()) {
    on<AuthLoggedIn>((event, emit) async {
      emit(AuthInProgress());
      await Future.delayed(const Duration(milliseconds: 800));

      final resp = await authLogin.execute(
        email: event.email,
        password: event.password,
      );
      resp.fold(
        (l) => emit(AuthFailure(message: l.message)),
        (r) => emit(AuthSuccess(message: r)),
      );
    });

    on<AuthRegistered>((event, emit) async {
      emit(AuthInProgress());
      await Future.delayed(const Duration(milliseconds: 800));

      final resp = await authRegister.execute(user: event.user);
      resp.fold(
        (l) => emit(AuthFailure(message: l.message)),
        (r) => emit(AuthSuccess(message: r)),
      );
    });

    on<AuthLoggedOut>((event, emit) async {
      emit(AuthInProgress());

      final resp = await authLogout.execute();
      resp.fold(
        (l) => emit(AuthFailure(message: l.message)),
        (r) => emit(AuthLogOutSuccess(message: r)),
      );
    });
  }
}
