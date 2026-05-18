import 'dart:convert';

import 'package:iquiz/src/core/common/exception.dart';
import 'package:iquiz/src/features/auth/data/datasources/db/database_helper.dart';
import 'package:iquiz/src/features/auth/data/models/user_table.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<String> registerUser(UserTable user);
  Future<String> loginUser({required String email, required String password});
  Future<String> logout();
  Future<UserTable?> checkAuthenticated();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final DatabaseHelper databaseHelper;

  AuthLocalDataSourceImpl(this.databaseHelper);
  static const USER_CACHE = 'user';

  @override
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final resp = await databaseHelper.loginUser(email, password);
      if (resp == null) {
        throw DatabaseException("Email atau password Salah!");
      }
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(USER_CACHE, jsonEncode(resp.toJson(withId: true)));
      return "Login Berhasil!";
    } on DatabaseException catch (e) {
      throw DatabaseException(e.message);
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> registerUser(UserTable user) async {
    try {
      await databaseHelper.saveUser(user);
      return "Daftar Berhasil!";
    } on DatabaseException catch (e) {
      throw DatabaseException(e.message);
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> logout() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(USER_CACHE);
      return "Logout Berhasil";
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<UserTable?> checkAuthenticated() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final resp = prefs.getString(USER_CACHE);
      if (resp == null) {
        throw DatabaseException("Akun Terlogout!");
      }

      return UserTable.fromMap(jsonDecode(resp));
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }
}
