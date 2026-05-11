import 'package:flutter/material.dart';

/// Kelas yang menyimpan warna-warna yang digunakan dalam aplikasi.
class AppPalette {
  /// Light Mode Palette
  static const Color primary = Color(0xFF0009FF);
  static const Color secondary = Color(0xFF2D6EFF);
  static const Color backgroundWhite = Color(0xFFFFFFFF);
  static const Color backgroundScaffold = Color(0xFFE6E6E6);
  static const Color textPrimary = Color(0xFF000000);
  static const Color textSecondary = Color(0xFF828282);
  static const Color redMain = Color(0xFFFE2C55);
  static const Color border = Color(0xFFE0E0E0);

  /// Dark Mode Palette
  static const Color backgroundDark = Color.fromARGB(255, 0, 0, 0);
  static const Color textPrimaryDark = Color(0xFFFFFFFF);
  static const Color borderDark = Color.fromARGB(255, 67, 67, 67);
}
