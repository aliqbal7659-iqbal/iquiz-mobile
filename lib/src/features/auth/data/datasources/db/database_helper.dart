import 'package:iquiz/src/features/auth/data/models/user_table.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  DatabaseHelper._instance() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._instance();

  static Database? _database;

  Future<Database?> get database async {
    _database ??= await _initDb();
    return _database;
  }

  static const String _tblUser = 'user';

  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final databasePath = "$path/iquiz.db";

    var db = await openDatabase(databasePath, version: 1, onCreate: _onCreate);
    return db;
  }

  /// Table Users
  void _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $_tblUser (
      id INTEGER PRIMARY KEY,
      full_name TEXT,
      email TEXT,
      password TEXT
    );
    ''');
  }

  Future<int> saveUser(UserTable user) async {
    final db = await database;
    return await db!.insert(_tblUser, user.toJson());
  }

  Future<UserTable?> loginUser(String email, String password) async {
    final db = await database;

    final List<Map<String, dynamic>> results = await db!.query(
      _tblUser,
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );

    if (results.isNotEmpty) {
      return UserTable.fromMap(results.first);
    } else {
      return null;
    }
  }
}
