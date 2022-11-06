import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:practica1/models/tareas_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;
  static final nombreBD = 'TAREASBD';
  static final versionDB = 1;
  static final DatabaseHelper db = DatabaseHelper._();
  DatabaseHelper._();

  Future<Database> get database async {
    if (_database != null) return _database!;
    return _database = await _initDatabase();
  }

  _initDatabase() async {
    Directory carpeta = await getApplicationDocumentsDirectory();
    String rutaBD = join(carpeta.path, nombreBD);
    return await openDatabase(
      rutaBD,
      version: versionDB,
      onCreate: _crearTablas,
    );
  }

  _crearTablas(Database db, int version) async {
    String query =
        "CREATE TABLE tblTareas( idTarea INTEGER PRIMARY KEY, dscTarea VARCHAR(100), fechaEnt DATE)";
    db.execute(query);
  }

  Future<int> insertar(Map<String, dynamic> row, String nomTabla) async {
    var conexion = await database;
    return await conexion.insert(nomTabla, row);
  }

  Future<int> actualizar(Map<String, dynamic> row, String nomTabla) async {
    var conexion = await database;
    return await conexion.update(
      nomTabla,
      row,
      where: 'idTarea = ?',
      whereArgs: [row['idTarea']],
    );
  }

  Future<int> eliminar(int idTarea, String nomTabla) async {
    var conexion = await database;
    return await conexion.delete(
      nomTabla,
      where: 'idTarea=?',
      whereArgs: [idTarea],
    );
  }

  Future<List<TaskDAO>> getAllTareas() async {
    var conexion = await database;
    var result = await conexion.query('tblTareas');
    return result.map((mapTarea) => TaskDAO.fromJSON(mapTarea)).toList();
  }
}
