import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iquiz/src/features/auth/presentation/blocs/auth/auth_bloc.dart';

class SubmitLoginUtils {
  final BuildContext context;
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  SubmitLoginUtils(
    this.context, {
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  void execute() {
    if (!context.mounted) return;
    if (formKey.currentState?.validate() == true) {
      BlocProvider.of<AuthBloc>(context, listen: false).add(
        AuthLoggedIn(
          email: emailController.text,
          password: passwordController.text,
        ),
      );
    }
  }
}
