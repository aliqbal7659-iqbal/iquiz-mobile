import 'package:flutter/material.dart';
import 'package:iquiz/src/features/materi/presentation/pages/modul_page.dart';

class NavigateToModul {
  final BuildContext context;

  /// Berisi nama json modul yang tersimpan di lokal
  final String modulJsonName;

  /// Berisi nama dari materi yang dibuka
  final String label;

  NavigateToModul(
    this.context, {
    required this.modulJsonName,
    required this.label,
  });

  void execute() {
    if (!context.mounted) return;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            ModulPage(modulJsonName: modulJsonName, label: label),
      ),
    );
  }
}
