import 'dart:convert';

import 'package:iquiz/src/core/common/exception.dart';
import 'package:iquiz/src/core/themes/app_json.dart';
import 'package:iquiz/src/features/materi/data/models/materi_response.dart';

abstract class MateriLocalDatasource {
  Future<List<MateriResponse>> getMateri();
  Future<List<MateriResponse>> searchMateri({required String search});
}

final class MateriLocalDataSourceImpl implements MateriLocalDatasource {
  @override
  Future<List<MateriResponse>> getMateri() async {
    try {
      final Map<String, dynamic> resp = await Future.value(
        jsonDecode(AppJson.materi),
      );
      return (resp['data'] as List)
          .map((json) => MateriResponse.fromJson(json))
          .toList();
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<List<MateriResponse>> searchMateri({required String search}) async {
    try {
      final Map<String, dynamic> resp = await Future.value(
        jsonDecode(AppJson.materi),
      );
      final data = (resp['data'] as List)
          .map((json) => MateriResponse.fromJson(json))
          .toList();

      if (data.isEmpty) return Future.value([]);

      final searchedData = data.where((item) => item.name == search).toList();
      return Future.value(searchedData);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
