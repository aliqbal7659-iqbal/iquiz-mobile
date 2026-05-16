import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:iquiz/src/core/common/exception.dart';
import 'package:iquiz/src/core/themes/app_json.dart';
import 'package:iquiz/src/features/try_out/data/models/tryout_question_response.dart';
import 'package:iquiz/src/features/try_out/data/models/tryout_response.dart';

abstract class TryoutLocalDatasource {
  Future<List<TryoutResponse>> getTryOut();
  Future<List<TryoutResponse>> searchTryOut({required String keyword});

  Future<List<TryoutQuestionResponse>> getQuestion({required String fileName});
}

class TryoutLocalDatasourceImpl implements TryoutLocalDatasource {
  @override
  Future<List<TryoutResponse>> getTryOut() async {
    try {
      await Future.delayed(const Duration(milliseconds: 800));

      final String jsonString = await rootBundle.loadString(AppJson.tryOut);
      final Map<String, dynamic> resp = await Future.value(
        jsonDecode(jsonString),
      );

      return (resp['data'] as List)
          .map((json) => TryoutResponse.fromJson(json))
          .toList();
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<List<TryoutResponse>> searchTryOut({required String keyword}) async {
    try {
      await Future.delayed(const Duration(milliseconds: 800));

      final String jsonString = await rootBundle.loadString(AppJson.tryOut);
      final Map<String, dynamic> resp = await Future.value(
        jsonDecode(jsonString),
      );

      final data = (resp['data'] as List)
          .map((json) => TryoutResponse.fromJson(json))
          .toList();
      if (data.isEmpty) return Future.value([]);

      final searchedData = data
          .where(
            (item) => item.name!.toLowerCase().contains(keyword.toLowerCase()),
          )
          .toList();
      return Future.value(searchedData);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<List<TryoutQuestionResponse>> getQuestion({
    required String fileName,
  }) async {
    try {
      await Future.delayed(const Duration(milliseconds: 800));

      final String jsonString = await rootBundle.loadString(AppJson.tryOut);
      final Map<String, dynamic> resp = await Future.value(
        jsonDecode(jsonString),
      );

      return (resp['data'] as List)
          .map((json) => TryoutQuestionResponse.fromJson(json))
          .toList();
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
