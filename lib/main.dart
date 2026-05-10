import 'package:flutter/material.dart';
import 'package:iquiz/injection.dart' as di;
import 'package:iquiz/src/core/themes/app_theme.dart';
import 'package:iquiz/src/features/splash/pages/splash_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iQuiz',
      theme: AppTheme.lightThemeMode,
      home: const SplashPage(),
    );
  }
}
