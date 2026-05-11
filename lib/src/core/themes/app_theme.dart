import 'package:flutter/material.dart';
import 'package:iquiz/src/core/themes/app_palette.dart';

/// kelas yang menyimpan tema-tema yang digunakan dalam aplikasi.
class AppTheme {
  static final lightThemeMode = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppPalette.backgroundWhite,
  );

  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppPalette.backgroundDark,
  );
}
