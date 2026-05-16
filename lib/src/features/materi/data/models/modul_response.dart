import 'package:iquiz/src/features/materi/domain/entities/modul.dart';

class ModulResponse {
  final num? id;
  final String? name;
  final String? description;
  final String? courseLink;

  ModulResponse({this.id, this.name, this.description, this.courseLink});

  Modul toModel() {
    return Modul(
      id: id,
      name: name,
      description: description,
      courseLink: courseLink,
    );
  }

  factory ModulResponse.fromJson(Map<String, dynamic> json) {
    return ModulResponse(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      courseLink: json['course_link'],
    );
  }
}
