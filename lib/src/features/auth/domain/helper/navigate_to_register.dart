import 'package:flutter/material.dart';
import 'package:iquiz/src/features/auth/presentation/pages/register_page.dart';

class NavigateToRegisterHelper {
  final BuildContext context;

  NavigateToRegisterHelper(this.context);

  void execute() {
    if (!context.mounted) return;
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (context) => RegisterPage()));
  }
}
