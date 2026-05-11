import 'package:iquiz/src/shared/domain/repositories/theme_repository.dart';

class SaveThemeModeUsecase {
  final ThemeRepository repository;

  SaveThemeModeUsecase(this.repository);

  Future<void> execute(bool isDarkMode) async {
    await repository.saveTheme(isDarkMode);
  }
}
