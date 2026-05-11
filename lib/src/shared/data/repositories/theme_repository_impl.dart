import 'package:iquiz/src/shared/data/datasources/theme_local_datasource.dart';
import 'package:iquiz/src/shared/domain/repositories/theme_repository.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  final ThemeLocalDatasource localDatasource;

  ThemeRepositoryImpl({required this.localDatasource});
  @override
  Future<bool> getTheme() async {
    final resp = await localDatasource.getTheme();
    return resp;
  }

  @override
  Future<void> saveTheme(bool isDarkMode) async {
    await localDatasource.saveTheme(isDarkMode);
  }
}
