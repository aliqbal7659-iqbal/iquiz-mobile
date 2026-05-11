import 'package:get_it/get_it.dart';
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

  /// Repositories
  sl.registerLazySingleton<ThemeRepository>(
    () => ThemeRepositoryImpl(localDatasource: sl()),
  );

  /// Datasource
  sl.registerLazySingleton<ThemeLocalDatasource>(
    () => ThemeLocalDatasourceImpl(sl()),
  );

  /// Blocs
  /// Helper
  /// External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
