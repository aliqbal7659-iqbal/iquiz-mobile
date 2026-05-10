import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFont {
  static TextStyle interFont = GoogleFonts.inter();

  static TextStyle interSplashFont = interFont.copyWith(
    fontSize: 48,
    fontWeight: FontWeight.w500,
    height: 150,
  );
}
