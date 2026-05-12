import 'package:get_it/get_it.dart';
import 'package:iquiz/src/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:iquiz/src/features/auth/data/datasources/db/database_helper.dart';
import 'package:iquiz/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:iquiz/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:iquiz/src/features/auth/domain/usecases/auth_check.dart';
import 'package:iquiz/src/features/auth/domain/usecases/auth_login.dart';
import 'package:iquiz/src/features/auth/domain/usecases/auth_logout.dart';
import 'package:iquiz/src/features/auth/domain/usecases/auth_register.dart';
import 'package:iquiz/src/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:iquiz/src/features/auth/presentation/blocs/auth_check/auth_check_bloc.dart';
import 'package:iquiz/src/shared/data/datasources/theme_local_datasource.dart';
import 'package:iquiz/src/shared/data/repositories/theme_repository_impl.dart';
import 'package:iquiz/src/shared/domain/repositories/theme_repository.dart';
import 'package:iquiz/src/shared/domain/usecases/get_theme_mode.dart';
import 'package:iquiz/src/shared/domain/usecases/save_theme_mode.dart';
import 'package:iquiz/src/shared/presentation/providers/theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// Provider
  sl.registerFactory(
    () => ThemeProvider(
      saveThemeMode: SaveThemeModeUsecase(sl()),
      getThemeMode: GetThemeModeUsecase(sl()),
    ),
  );

  /// Use Case
  sl.registerLazySingleton(() => GetThemeModeUsecase(sl()));
  sl.registerLazySingleton(() => SaveThemeModeUsecase(sl()));
  sl.registerLazySingleton(() => AuthLogin(sl()));
  sl.registerLazySingleton(() => AuthRegister(sl()));
  sl.registerLazySingleton(() => AuthCheck(sl()));
  sl.registerLazySingleton(() => AuthLogout(sl()));

  /// Repositories
  sl.registerLazySingleton<ThemeRepository>(
    () => ThemeRepositoryImpl(localDatasource: sl()),
  );
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(localDatasource: sl()),
  );

  /// Datasource
  sl.registerLazySingleton<ThemeLocalDatasource>(
    () => ThemeLocalDatasourceImpl(sl()),
  );
  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(sl()),
  );

  /// Blocs
  sl.registerLazySingleton(
    () => AuthBloc(authLogin: sl(), authRegister: sl(), authLogout: sl()),
  );
  sl.registerLazySingleton(() => AuthCheckBloc(authCheck: sl()));

  /// Helper
  sl.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  /// External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
