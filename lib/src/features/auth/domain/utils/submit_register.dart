import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iquiz/src/features/auth/domain/entities/user.dart';
import 'package:iquiz/src/features/auth/presentation/blocs/auth/auth_bloc.dart';

class SubmitRegisterUtil {
  final BuildContext context;
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController nameController;

  SubmitRegisterUtil(
    this.context, {
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.nameController,
  });

  void execute() {
    if (!context.mounted) return;
    if (formKey.currentState?.validate() == true) {
      /// Konversi data dari controller ke dalam model
      final data = User(
        id: 0,
        fullName: nameController.text,
        email: emailController.text,
        password: passwordController.text,
      );

      BlocProvider.of<AuthBloc>(
        context,
        listen: false,
      ).add(AuthRegistered(data));
    }
  }
}
