import 'package:iquiz/src/features/materi/domain/entities/materi.dart';

class MateriResponse {
  final num? id;
  final String? name;
  final String? modulName;
  final num? totalModul;

  MateriResponse({this.id, this.name, this.modulName, this.totalModul});

  Materi toModel() {
    return Materi(
      id: id,
      name: name,
      modulName: modulName,
      totalModul: totalModul,
    );
  }

  factory MateriResponse.fromJson(Map<String, dynamic> json) {
    return MateriResponse(
      id: json['id'],
      name: json['name'],
      modulName: json['modul_name'],
      totalModul: json['total_modul'],
    );
  }
}
