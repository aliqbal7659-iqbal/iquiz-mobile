import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:iquiz/src/core/common/exception.dart';
import 'package:iquiz/src/core/themes/app_json.dart';
import 'package:iquiz/src/features/materi/data/models/modul_response.dart';

abstract class ModulLocalDatasource {
  Future<List<ModulResponse>> getModul({required String fileName});
}

class ModulLocalDataSourceImpl implements ModulLocalDatasource {
  @override
  Future<List<ModulResponse>> getModul({required String fileName}) async {
    try {
      await Future.delayed(const Duration(milliseconds: 800));

      final String jsonString = await rootBundle.loadString(
        "${AppJson.asset}/$fileName",
      );
      final Map<String, dynamic> resp = await Future.value(
        jsonDecode(jsonString),
      );

      return (resp['data'] as List)
          .map((json) => ModulResponse.fromJson(json))
          .toList();
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
