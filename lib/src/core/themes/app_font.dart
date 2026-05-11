import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// kelas yang menyimpan font yang digunakan dalam aplikasi.
class AppFont {
  static TextStyle interFont = GoogleFonts.inter();

  static TextStyle interSplashFont = interFont.copyWith(
    fontSize: 48,
    fontWeight: FontWeight.w500,
    height: 150,
  );
}
