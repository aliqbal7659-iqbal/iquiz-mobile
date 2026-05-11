import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// kelas yang menyimpan font yang digunakan dalam aplikasi.
class AppFont {
  static TextStyle interFont = GoogleFonts.inter();

  static TextStyle interSplashFont = interFont.copyWith(
    fontSize: 48,
    fontWeight: FontWeight.w500,
  );

  static TextStyle interLargeRegular = interFont.copyWith(fontSize: 24);
  static TextStyle interLargeSemiBold = interLargeRegular.copyWith(
    fontWeight: FontWeight.w500,
  );
  static TextStyle interLargeBold = interLargeRegular.copyWith(
    fontWeight: FontWeight.w600,
  );

  static TextStyle interTitleRegular = interFont.copyWith(fontSize: 16);
  static TextStyle interTitleSemiBold = interTitleRegular.copyWith(
    fontWeight: FontWeight.w500,
  );
  static TextStyle interTitleBold = interTitleRegular.copyWith(
    fontWeight: FontWeight.w600,
  );

  static TextStyle interMediumRegular = interFont.copyWith(fontSize: 14);
  static TextStyle interMediumSemiBold = interMediumRegular.copyWith(
    fontWeight: FontWeight.w500,
  );
  static TextStyle interMediumBold = interMediumRegular.copyWith(
    fontWeight: FontWeight.w600,
  );

  static TextStyle interSmallRegular = interFont.copyWith(fontSize: 12);
  static TextStyle interSmallSemiBold = interSmallRegular.copyWith(
    fontWeight: FontWeight.w500,
  );
  static TextStyle interSmallBold = interSmallRegular.copyWith(
    fontWeight: FontWeight.w600,
  );
  static TextStyle interxSmallRegular = interFont.copyWith(fontSize: 10);
  static TextStyle interxSmallSemiBold = interxSmallRegular.copyWith(
    fontWeight: FontWeight.w500,
  );
  static TextStyle interxSmallBold = interxSmallRegular.copyWith(
    fontWeight: FontWeight.w600,
  );
}
