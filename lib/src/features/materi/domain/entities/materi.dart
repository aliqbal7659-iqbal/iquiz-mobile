import 'package:equatable/equatable.dart';

class Materi extends Equatable {
  final num? id;
  final String? name;
  final String? modulName;

  const Materi({this.id, this.name, this.modulName});

  @override
  List<Object?> get props => [id, name, modulName];
}
