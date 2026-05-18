import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iquiz/src/features/auth/domain/helper/navigate_to_login.dart';
import 'package:iquiz/src/features/auth/presentation/blocs/auth_check/auth_check_bloc.dart';
import 'package:iquiz/src/shared/domain/helper/navigate_to_home.dart';
import 'package:iquiz/src/shared/domain/helper/navigate_to_splash.dart';
import 'package:iquiz/src/shared/presentation/widgets/iquiz_title_widget.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<AuthCheckBloc>(
        context,
      ).add(AuthChecked(isFromSplash: true));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCheckBloc, AuthCheckState>(
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          NavigateToHomeHelper(context).execute();
        } else if (state is AuthUnauthenticated) {
          NavigateToLoginHelper(context).execute();
        } else {
          NavigateToSplashHelper(context).execute();
        }
      },
      child: Scaffold(
        body: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: IquizTitleWidget(),
        ),
      ),
    );
  }
}
