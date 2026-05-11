import 'package:flutter/material.dart';
import 'package:iquiz/src/features/login/presentation/pages/login_page.dart';

/// Helper yang digunakan untuk navigasi ke halaman login.
class NavigateToLoginHelper {
  final BuildContext context;

  NavigateToLoginHelper(this.context);

  void execute() {
    if (!context.mounted) return;
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
