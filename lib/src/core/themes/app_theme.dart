import 'package:flutter/material.dart';
import 'package:iquiz/src/core/themes/app_palette.dart';

/// kelas yang menyimpan tema-tema yang digunakan dalam aplikasi.
class AppTheme {
  static final lightThemeMode = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppPalette.backgroundScaffold,
  );

  static final darkThemeMode = ThemeData.light().copyWith();
}
