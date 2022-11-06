import 'package:flutter/material.dart';
import 'package:practica1/database/database_helper.dart';
import 'package:practica1/models/tareas_model.dart';

class TaskProvider extends ChangeNotifier {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  List<TaskDAO> tasks = [];
  String txtFecha = '';
  String txtDesc = '';
  int id = 0;

//Acceso a la base de datos
  Future<TaskDAO> newTask(String dscTarea, String fechaEnt) async {
    final id = await DatabaseHelper.db.insertar(
      {'dscTarea': dscTarea, 'fechaEnt': fechaEnt},
      'tblTareas',
    );
    final newTask =
        TaskDAO(dscTarea: dscTarea, fechaEnt: fechaEnt, idTarea: id);
    tasks.add(newTask);
    notifyListeners();
    return newTask;
  }

  cargarScans() async {
    final tasks = await DatabaseHelper.db.getAllTareas();
    this.tasks = [...tasks];
    notifyListeners();
  }

  borrarById(int id) async {
    await DatabaseHelper.db.eliminar(id, 'tblTareas');
    cargarScans();
  }

  actualizar(String dscTarea, String fechaEnt, int id) async {
    await DatabaseHelper.db.actualizar(
        {'dscTarea': dscTarea, 'fechaEnt': fechaEnt, 'idTarea': id},
        'tblTareas');
    cargarScans();
  }
//Formulario de task screen

}
