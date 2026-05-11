import 'package:flutter/material.dart';
import 'package:iquiz/src/core/themes/app_font.dart';
import 'package:iquiz/src/core/themes/app_palette.dart';

/// kelas yang menyimpan tema-tema yang digunakan dalam aplikasi.
class AppTheme {
  static final lightThemeMode = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppPalette.backgroundWhite,

    /// Text Input Theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppPalette.backgroundWhite,
      hintStyle: AppFont.interMediumRegular.copyWith(
        color: AppPalette.textSecondary,
      ),
      errorStyle: AppFont.interSmallRegular.copyWith(color: AppPalette.redMain),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppPalette.border),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppPalette.secondary),
        borderRadius: BorderRadius.circular(8),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppPalette.redMain),
        borderRadius: BorderRadius.circular(8),
      ),
    ),

    /// Button
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: AppPalette.primary),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        overlayColor: AppPalette.backgroundScaffold,
        backgroundColor: AppPalette.primary,
      ),
    ),
  );

  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppPalette.backgroundDark,

    /// Text Input Theme
    // inputDecorationTheme: InputDecorationTheme(
    //   // filled: true,
    //   fillColor: AppPalette.backgroundDark,
    //   hintStyle: AppFont.interMediumRegular.copyWith(
    //     color: AppPalette.textPrimaryDark,
    //   ),
    //   border: OutlineInputBorder(
    //     borderSide: BorderSide(color: AppPalette.borderDark),
    //     borderRadius: BorderRadius.circular(8),
    //   ),
    //   focusedBorder: OutlineInputBorder(
    //     borderSide: BorderSide(color: AppPalette.secondary),
    //     borderRadius: BorderRadius.circular(8),
    //   ),
    // ),
  );
}
