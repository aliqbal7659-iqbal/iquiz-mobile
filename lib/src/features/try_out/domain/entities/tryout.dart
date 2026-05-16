import 'package:equatable/equatable.dart';

class Tryout extends Equatable {
  final num? id;
  final String? fileName;
  final String? name;
  final num? questionTotal;

  const Tryout({this.id, this.fileName, this.name, this.questionTotal});

  @override
  List<Object?> get props => [id, fileName, name, questionTotal];
}
