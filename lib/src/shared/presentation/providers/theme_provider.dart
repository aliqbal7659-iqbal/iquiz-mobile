import 'package:flutter/material.dart';
import 'package:iquiz/src/shared/domain/usecases/get_theme_mode.dart';
import 'package:iquiz/src/shared/domain/usecases/save_theme_mode.dart';

class ThemeProvider with ChangeNotifier {
  final SaveThemeModeUsecase saveThemeMode;
  final GetThemeModeUsecase getThemeMode;

  ThemeMode themeMode = ThemeMode.dark;

  ThemeProvider({required this.saveThemeMode, required this.getThemeMode}) {
    _init();
  }

  void toggleTheme(bool isDarkMode) async {
    themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    await saveThemeMode.execute(isDarkMode);
    notifyListeners();
  }

  void _init() async {
    final isDark = await getThemeMode.execute();
    themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
