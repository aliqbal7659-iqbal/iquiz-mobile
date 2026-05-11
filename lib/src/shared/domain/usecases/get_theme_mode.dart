import 'package:iquiz/src/shared/domain/repositories/theme_repository.dart';

class GetThemeModeUsecase {
  final ThemeRepository repository;

  GetThemeModeUsecase(this.repository);

  Future<bool> execute() async {
    final resp = await repository.getTheme();
    return resp;
  }
}
