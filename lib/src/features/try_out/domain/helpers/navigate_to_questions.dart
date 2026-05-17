import 'package:flutter/material.dart';
import 'package:iquiz/src/features/try_out/presentation/pages/try_out_question_page.dart';

class NavigateToQuestions {
  final BuildContext context;
  final String fileName;
  final String label;

  NavigateToQuestions(
    this.context, {
    required this.fileName,
    required this.label,
  });

  void execute() {
    if (!context.mounted) return;

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            TryOutQuestionPage(label: label, fileName: fileName),
      ),
    );
  }
}
