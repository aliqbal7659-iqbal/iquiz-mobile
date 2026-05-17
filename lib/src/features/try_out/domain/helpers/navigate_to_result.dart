import 'package:flutter/material.dart';
import 'package:iquiz/src/features/try_out/domain/entities/tryout_answer.dart';
import 'package:iquiz/src/features/try_out/presentation/pages/try_out_result_page.dart';

class NavigateToResult {
  final BuildContext context;
  final List<TryoutAnswer> answers;
  final num score;

  NavigateToResult(this.context, {required this.answers, required this.score});

  void execute() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) =>
            TryOutResultPage(answeredQuestions: answers, score: score),
      ),
    );
  }
}
