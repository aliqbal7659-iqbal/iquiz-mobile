import 'package:flutter/material.dart';
import 'package:iquiz/src/features/materi/presentation/pages/materi_page.dart';

class NavigateToMateriHelper {
  final BuildContext context;

  NavigateToMateriHelper(this.context);

  void execute() {
    if (!context.mounted) return;

    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => MateriPage()));
  }
}
