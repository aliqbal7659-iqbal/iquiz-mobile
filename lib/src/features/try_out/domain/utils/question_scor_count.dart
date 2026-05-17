/// Rumus Mendapatkan Nilai
class QuestionScorCount {
  final num totalQuestion;
  final num totalCorrect;

  QuestionScorCount({required this.totalQuestion, required this.totalCorrect});

  num execute() {
    return ((totalCorrect / totalQuestion) * 100).round();
  }
}
