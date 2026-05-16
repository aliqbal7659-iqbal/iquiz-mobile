import 'package:equatable/equatable.dart';

class Materi extends Equatable {
  final num? id;
  final String? name;
  final String? modulName;
  final num? totalModul;

  const Materi({this.id, this.name, this.modulName, this.totalModul});

  @override
  List<Object?> get props => [id, name, modulName, totalModul];
}
