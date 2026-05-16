import 'package:iquiz/src/features/materi/domain/entities/materi.dart';

class MateriResponse {
  final num? id;
  final String? name;
  final String? modulName;

  MateriResponse({this.id, this.name, this.modulName});

  Materi toModel() {
    return Materi(id: id, name: name, modulName: modulName);
  }

  factory MateriResponse.fromJson(Map<String, dynamic> json) {
    return MateriResponse(
      id: json['id'],
      name: json['name'],
      modulName: json['modul_name'],
    );
  }
}
