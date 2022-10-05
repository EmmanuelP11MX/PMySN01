import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:practica1/models/users_model.dart';
import 'package:sqflite/sqflite.dart';

class DBProviderUser {
  static Database? _database;
  static final DBProviderUser db = DBProviderUser._();
  DBProviderUser._();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'User.db');
    print(path);
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('''
        CREATE TABLE User(
          id INTEGER PRIMARY KEY, 
          fullName TEXT,
          email TEXT, 
          phone TEXT,
          githubpage TEXT,
          image TEXT
        )''');
    });
  }

  Future<int> newUser(UserDAO user) async {
    final db = await database;
    final res = await db.insert('User', user.toJson());
    return res;
  }

  Future<List<UserDAO>?> getUser() async {
    final db = await database;
    final res = await db.query('User');
    return res.isNotEmpty ? res.map((s) => UserDAO.fromJson(s)).toList() : [];
  }

  Future<int> updateUser(UserDAO updateUser) async {
    final db = await database;
    final res = await db.update('User', updateUser.toJson(),
        where: 'id=?', whereArgs: [updateUser.id]);
    return res;
  }

  Future<int> deleteUser(int id) async {
    final db = await database;
    final res = await db.delete('User', where: 'id=?', whereArgs: [id]);
    return res;
  }
}
