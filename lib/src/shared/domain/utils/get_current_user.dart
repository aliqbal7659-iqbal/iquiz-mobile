import 'dart:convert';

import 'package:iquiz/src/features/auth/data/models/user_table.dart';
import 'package:iquiz/src/features/auth/domain/entities/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetCurrentUser {
  static Future<User?> execute() async {
    final prefs = await SharedPreferences.getInstance();
    final user = prefs.getString('user');

    if (user != null) {
      return Future.delayed(
        const Duration(milliseconds: 300),
      ).then((_) => UserTable.fromMap(jsonDecode(user)).toEntity());
    }

    return Future.delayed(const Duration(milliseconds: 300)).then((_) => null);
  }
}
