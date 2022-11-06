import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:practica1/models/models.dart';
import 'package:sqflite/sqflite.dart';

class DBProviderMovies {
  static Database? _database;
  static final DBProviderMovies db = DBProviderMovies._();
  DBProviderMovies._();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'Movies.db');
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('''
        CREATE TABLE Movies(
          id INTEGER PRIMARY KEY,
          movie_id INTEGER
        )''');
    });
  }

  Future<int> insertar(FavoriteMovie row, String nomTabla) async {
    var conexion = await database;
    return await conexion.insert(nomTabla, row.toJson());
  }

  Future<List<FavoriteMovie>> getMovie() async {
    final db = await database;
    final res = await db.query(
      'Movies',
    );
    return res.isNotEmpty
        ? res.map((s) => FavoriteMovie.fromJSON(s)).toList()
        : [];
  }

  Future<bool> getMovieId(int id) async {
    final db = await database;
    final res = await db.query(
      'Movies',
      where: 'movie_id=?',
      whereArgs: [id],
    );
    return res.isEmpty ? false : true;
  }

  Future<int> deleteMovie(int id) async {
    final db = await database;
    final res = await db.delete(
      'Movies',
      where: 'movie_id=?',
      whereArgs: [id],
    );
    return res;
  }
}
