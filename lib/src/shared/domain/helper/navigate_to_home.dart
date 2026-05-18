import 'package:flutter/material.dart';
import 'package:iquiz/src/features/home/presentation/pages/home_page.dart';

class NavigateToHomeHelper {
  final BuildContext context;

  NavigateToHomeHelper(this.context);

  void execute() {
    if (!context.mounted) return;

    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
  }
}
