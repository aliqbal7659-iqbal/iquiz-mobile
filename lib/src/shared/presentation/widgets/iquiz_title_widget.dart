import 'package:flutter/material.dart';
import 'package:iquiz/src/core/themes/app_font.dart';
import 'package:iquiz/src/core/themes/app_palette.dart';
import 'package:iquiz/src/shared/presentation/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class IquizTitleWidget extends StatelessWidget {
  final TextStyle? textStyle;
  const IquizTitleWidget({super.key, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return Center(child: _buildText(themeProvider));
      },
    );
  }

  Text _buildText(ThemeProvider themeProvider) {
    return Text.rich(
      TextSpan(
        text: 'i',
        style:
            textStyle?.copyWith(color: AppPalette.secondary) ??
            AppFont.interSplashFont.copyWith(color: AppPalette.secondary),
        children: <TextSpan>[
          TextSpan(
            text: 'Quiz',
            style:
                textStyle?.copyWith(color: _getTextColor(themeProvider)) ??
                AppFont.interSplashFont.copyWith(
                  color: _getTextColor(themeProvider),
                ),
          ),
        ],
      ),
    );
  }

  Color _getTextColor(ThemeProvider themeProvider) {
    return themeProvider.themeMode == ThemeMode.light
        ? AppPalette.textPrimary
        : AppPalette.textPrimaryDark;
  }
}
