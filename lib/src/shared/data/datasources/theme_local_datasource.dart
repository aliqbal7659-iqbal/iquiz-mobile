import 'package:shared_preferences/shared_preferences.dart';

abstract class ThemeLocalDatasource {
  Future<bool> getTheme();
  Future<void> saveTheme(bool isDarkMode);
}

class ThemeLocalDatasourceImpl implements ThemeLocalDatasource {
  final SharedPreferences sharedPreferences;

  ThemeLocalDatasourceImpl(this.sharedPreferences);
  @override
  Future<bool> getTheme() async =>
      sharedPreferences.getBool('isDarkMode') ?? false;

  @override
  Future<void> saveTheme(bool isDarkMode) async =>
      sharedPreferences.setBool('isDarkMode', isDarkMode);
}
