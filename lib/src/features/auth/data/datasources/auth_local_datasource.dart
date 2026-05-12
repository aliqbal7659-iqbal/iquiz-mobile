import 'dart:convert';

import 'package:iquiz/src/core/common/exception.dart';
import 'package:iquiz/src/features/auth/data/datasources/db/database_helper.dart';
import 'package:iquiz/src/features/auth/data/models/user_table.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<String> registerUser(UserTable user);
  Future<String> loginUser({required String email, required String password});
  Future<UserTable?> checkAuthenticated();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final DatabaseHelper databaseHelper;

  AuthLocalDataSourceImpl(this.databaseHelper);

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
      final prefs = SharedPreferencesAsync();
      await prefs.setString('user', jsonEncode(resp.toJson()));
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
  Future<UserTable?> checkAuthenticated() async {
    try {
      final prefs = SharedPreferencesAsync();
      final resp = await prefs.getString('user');
      if (resp == null) {
        throw DatabaseException("Akun Terlogout!");
      }
      return UserTable.fromMap(jsonDecode(resp));
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }
}
