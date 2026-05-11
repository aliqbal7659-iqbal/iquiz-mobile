import 'package:flutter/material.dart';
import 'package:iquiz/src/core/themes/app_font.dart';
import 'package:iquiz/src/core/themes/app_palette.dart';
import 'package:iquiz/src/shared/presentation/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) {
            return Center(child: _buildText(themeProvider));
          },
        ),
      ),
    );
  }

  Text _buildText(ThemeProvider themeProvider) {
    return Text.rich(
      TextSpan(
        text: 'i',
        style: AppFont.interSplashFont.copyWith(color: AppPalette.secondary),
        children: <TextSpan>[
          TextSpan(
            text: 'Quiz',
            style: AppFont.interSplashFont.copyWith(
              color: themeProvider.themeMode == ThemeMode.light
                  ? AppPalette.textPrimary
                  : AppPalette.textPrimaryLight,
            ),
          ),
        ],
      ),
    );
  }
}
