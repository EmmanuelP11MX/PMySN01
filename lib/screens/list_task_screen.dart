/*import 'package:flutter/material.dart';
import 'package:practica1/database/database_helper.dart';
import 'package:practica1/models/tareas_model.dart';
import 'package:sqflite/sqflite.dart';

class ListTaskScreen extends StatefulWidget {
  ListTaskScreen({Key? key}) : super(key: key);

  @override
  State<ListTaskScreen> createState() => _ListTaskScreenState();
}

class _ListTaskScreenState extends State<ListTaskScreen> {
  DataBaseHelper? _database;

  @override
  void initState() {
    super.initState();
    _database = DataBaseHelper();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Task'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/add');
            },
            icon: Icon(Icons.add_circle_outline),
          )
        ],
      ),
      body: FutureBuilder(
        future: _database!.getAllTareas(),
        builder: (context, AsyncSnapshot<List<TaskDAO>> snapshot) {
          if (snapshot.hasData)
            return ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  height: MediaQuery.of(context).size.height * .15,
                  width: double.infinity,
                  child: Column(
                    children: [
                      ListTile(
                          title: Text(snapshot.data![index].dscTarea!),
                          subtitle: Text(snapshot.data![index].dscTarea!)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/add', arguments: {
                                'idTarea': snapshot.data![index].idTarea,
                                'descTarea': snapshot.data![index].dscTarea,
                                'fecEntrega': snapshot.data![index].fechaEnt
                              }).then((value) {
                                setState(() {});
                              });
                            },
                            icon: Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () {
                              var dialogo = AlertDialog(
                                title: Text('Importante!!!'),
                                content: Text('¿Desea borrar esta tarea?'),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        _database!.eliminar(
                                            snapshot.data![index].idTarea!,
                                            'tblTareas');
                                      },
                                      child: Text('Aceptar')),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Cancelar'),
                                  )
                                ],
                              );
                              showDialog(
                                  context: context, builder: (_) => dialogo);
                            },
                            icon: Icon(Icons.delete),
                          )
                        ],
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Colors.red[100],
                      borderRadius: BorderRadius.circular(10)),
                );
              },
              itemCount: snapshot.data!.length,
            );
          else if (snapshot.hasError)
            return Center(child: Text('Ocurrio un error en la petición...'));

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}*/
