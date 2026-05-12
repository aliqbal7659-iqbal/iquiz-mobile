import 'package:bloc/bloc.dart';
import 'package:iquiz/src/core/common/logger.dart';
import 'package:iquiz/src/features/auth/domain/entities/user.dart';
import 'package:iquiz/src/features/auth/domain/usecases/auth_check.dart';

part 'auth_check_event.dart';
part 'auth_check_state.dart';

class AuthCheckBloc extends Bloc<AuthCheckEvent, AuthCheckState> {
  final AuthCheck authCheck;

  AuthCheckBloc({required this.authCheck}) : super(AuthCheckInitial()) {
    on<AuthChecked>((event, emit) async {
      if (event.isFromSplash) {
        await Future.delayed(const Duration(seconds: 2));
      }
      final resp = await authCheck.execute();
      logger.i(resp);
      resp.fold(
        (l) => emit(AuthUnauthenticated()),
        (r) => emit(AuthAuthenticated(user: r)),
      );
    });
  }
}
