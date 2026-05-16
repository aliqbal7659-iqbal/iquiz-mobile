import 'package:flutter/material.dart';
import 'package:iquiz/src/features/try_out/presentation/pages/try_out_page.dart';

class NavigateToTryoutHelper {
  final BuildContext context;

  NavigateToTryoutHelper(this.context);

  void execute() {
    if (!context.mounted) return;

    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => TryOutPage()));
  }
}
