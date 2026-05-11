abstract class ThemeRepository {
  Future<bool> getTheme();
  Future<void> saveTheme(bool isDarkMode);
}
