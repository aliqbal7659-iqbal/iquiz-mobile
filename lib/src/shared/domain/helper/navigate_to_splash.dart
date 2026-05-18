import 'package:flutter/material.dart';
import 'package:iquiz/src/features/splash/presentation/pages/splash_page.dart';

class NavigateToSplashHelper {
  final BuildContext context;

  NavigateToSplashHelper(this.context);

  void execute() {
    if (!context.mounted) return;
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (context) => SplashPage()));
  }
}
