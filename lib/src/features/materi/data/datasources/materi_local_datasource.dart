import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:iquiz/src/core/common/exception.dart';
import 'package:iquiz/src/core/common/logger.dart';
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
      await Future.delayed(const Duration(milliseconds: 800));

      final String jsonString = await rootBundle.loadString(AppJson.materi);
      final Map<String, dynamic> resp = await Future.value(
        jsonDecode(jsonString),
      );

      return (resp['data'] as List)
          .map((json) => MateriResponse.fromJson(json))
          .toList();
    } catch (e) {
      logger.e(e.toString());
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<List<MateriResponse>> searchMateri({required String search}) async {
    try {
      await Future.delayed(const Duration(milliseconds: 800));
      final String jsonString = await rootBundle.loadString(AppJson.materi);

      final Map<String, dynamic> resp = await Future.value(
        jsonDecode(jsonString),
      );
      final data = (resp['data'] as List)
          .map((json) => MateriResponse.fromJson(json))
          .toList();

      if (data.isEmpty) return Future.value([]);

      final searchedData = data
          .where(
            (item) => item.name!.toLowerCase().contains(search.toLowerCase()),
          )
          .toList();
      return Future.value(searchedData);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
