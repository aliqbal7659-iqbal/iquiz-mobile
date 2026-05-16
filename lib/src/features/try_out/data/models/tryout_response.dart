import 'package:iquiz/src/features/try_out/domain/entities/tryout.dart';

class TryoutResponse {
  final num? id;
  final String? fileName;
  final String? name;
  final num? questionTotal;

  TryoutResponse({this.id, this.fileName, this.name, this.questionTotal});

  Tryout toModel() {
    return Tryout(
      id: id,
      fileName: fileName,
      name: name,
      questionTotal: questionTotal,
    );
  }

  factory TryoutResponse.fromJson(Map<String, dynamic> json) {
    return TryoutResponse(
      id: json['id'],
      fileName: json['fileName'],
      name: json['name'],
      questionTotal: json['question_total'],
    );
  }
}
