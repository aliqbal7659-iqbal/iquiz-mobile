import 'package:flutter/material.dart';
import 'package:iquiz/injection.dart' as di;
import 'package:iquiz/src/core/themes/app_theme.dart';
import 'package:iquiz/src/features/splash/pages/splash_page.dart';
import 'package:iquiz/src/shared/presentation/providers/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Panggil fungsi inisialisasi depedency injection
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => di.sl<ThemeProvider>()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'iQuiz',
            themeMode: themeProvider.themeMode,
            theme: AppTheme.lightThemeMode,
            darkTheme: AppTheme.darkThemeMode,
            home: const SplashPage(),
          );
        },
      ),
    );
  }
}
