import 'package:flutter/material.dart';
import 'package:iquiz/src/features/materi/domain/entities/modul.dart';
import 'package:iquiz/src/features/materi/presentation/pages/modul_detail_page.dart';

class NavigateToDetailModul {
  final BuildContext context;
  final Modul data;

  NavigateToDetailModul(this.context, {required this.data});

  void execute() {
    if (!context.mounted) return;

    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => ModulDetailPage(data: data)),
    );
  }
}
