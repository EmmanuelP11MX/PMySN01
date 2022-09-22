import 'package:flutter/material.dart';
import 'package:practica1/database/database_helper.dart';
import 'package:practica1/models/tareas_model.dart';

class TaskScreen extends StatefulWidget {
  TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  DataBaseHelper? _database;
  bool ban = false;

  @override
  void initState() {
    super.initState();
    _database = DataBaseHelper();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController txtFecha = TextEditingController();
    TextEditingController txtDesc = TextEditingController();
    int idTarea = 0;

    if (ModalRoute.of(context)!.settings.arguments != null) {
      final tarea = ModalRoute.of(context)?.settings.arguments as Map;
      ban = true;
      txtFecha.text = tarea['fecEntrada'];
      txtDesc.text = tarea['dscTarea'];
      idTarea = tarea['idTarea'];
    }, 'tblTarea').then()

    final txtFechaEnt = TextField(
        controller: txtFecha,
        decoration: InputDecoration(border: OutlineInputBorder()));

    final txtDescTask = TextField(
        controller: txtDesc,
        decoration: InputDecoration(border: OutlineInputBorder()),
        maxLines: 8);

    final btnGuardar = ElevatedButton(
      onPressed: () {
        _database!.insertar({
          'dscTarea': txtDesc.text,
          'fechaEnt': txtFecha.text,
        }, 'tblTareas').then((value) {
          final snackBar =
              SnackBar(content: Text('Tarea registrada correctamente!'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        });
      } else {
        _database!.actualizar({}, 'tblTareas').then(value){
          final snackbar = SnackBar(content: Text('Tarea actualizada correctamente'));
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
        }
      },
      child: Text('Guardar'),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
      ),
      body: ListView(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * .05),
        children: [
          txtFechaEnt,
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: txtDescTask,
          ),
          btnGuardar,
        ],
      ),
    );
  }
}
