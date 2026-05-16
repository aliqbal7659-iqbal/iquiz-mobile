import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iquiz/injection.dart' as di;
import 'package:iquiz/src/core/themes/app_theme.dart';
import 'package:iquiz/src/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:iquiz/src/features/auth/presentation/blocs/auth_check/auth_check_bloc.dart';
import 'package:iquiz/src/features/auth/presentation/pages/login_page.dart';
import 'package:iquiz/src/features/home/presentation/pages/home_page.dart';
import 'package:iquiz/src/features/materi/presentation/blocs/materi/materi_bloc.dart';
import 'package:iquiz/src/features/splash/presentation/pages/splash_page.dart';
import 'package:iquiz/src/shared/presentation/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';

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
        BlocProvider(create: (context) => di.sl<AuthBloc>()),
        BlocProvider(
          create: (context) =>
              di.sl<AuthCheckBloc>()..add(AuthChecked(isFromSplash: true)),
        ),
        BlocProvider(create: (context) => di.sl<MateriBloc>()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return ToastificationWrapper(
            child: MaterialApp(
              title: 'iQuiz',
              themeMode: themeProvider.themeMode,
              theme: AppTheme.lightThemeMode,
              darkTheme: AppTheme.darkThemeMode,
              home: BlocBuilder<AuthCheckBloc, AuthCheckState>(
                builder: (context, state) {
                  if (state is AuthAuthenticated) {
                    return HomePage();
                  } else if (state is AuthUnauthenticated) {
                    return LoginPage();
                  }
                  return const SplashPage();
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
