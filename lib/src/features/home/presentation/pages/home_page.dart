import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iquiz/src/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:iquiz/src/features/auth/presentation/blocs/auth_check/auth_check_bloc.dart';
import 'package:iquiz/src/shared/presentation/widgets/button_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            final isCurrent = ModalRoute.of(context)?.isCurrent ?? false;
            if (isCurrent) {
              if (state is AuthLogOutSuccess) {
                BlocProvider.of<AuthCheckBloc>(
                  context,
                  listen: false,
                ).add(AuthChecked());
              }
            }
          },
          builder: (context, state) {
            return ButtonWidget(
              label: "Logout",
              onPressed: () {
                BlocProvider.of<AuthBloc>(
                  context,
                  listen: false,
                ).add(AuthLoggedOut());
              },
            );
          },
        ),
      ),
    );
  }
}
