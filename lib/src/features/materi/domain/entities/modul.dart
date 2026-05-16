import 'package:equatable/equatable.dart';

class Modul extends Equatable {
  final num? id;
  final String? name;
  final String? description;
  final String? courseLink;

  const Modul({this.id, this.name, this.description, this.courseLink});

  @override
  List<Object?> get props => [id, name, description, courseLink];
}
