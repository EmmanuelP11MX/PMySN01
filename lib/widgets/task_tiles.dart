import 'package:flutter/material.dart';

import 'package:practica1/providers/task_provider.dart';
import 'package:provider/provider.dart';

class TaskTiles extends StatelessWidget {
  const TaskTiles({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final taskLitsProvider = Provider.of<TaskProvider>(context);

    Icon icono = const Icon(
      Icons.task,
    );
    final tasks = taskLitsProvider.tasks;
    return ListView.builder(
        itemCount: taskLitsProvider.tasks.length,
        itemBuilder: (_, i) => Dismissible(
              key: UniqueKey(),
              background: Container(
                color: Colors.red,
              ),
              onDismissed: (DismissDirection direction) {
                Provider.of<TaskProvider>(context, listen: false)
                    .borrarById(tasks[i].idTarea!);
              },
              child: ListTile(
                  leading: icono,
                  title: Text("Fecha ${tasks[i].fechaEnt!}"),
                  subtitle: Text("Descripcion ${tasks[i].dscTarea}"),
                  trailing: const Icon(Icons.keyboard_arrow_right_outlined),
                  onTap: () {
                    Navigator.pushNamed(context, '/task', arguments: {
                      'idTarea': tasks[i].idTarea,
                      'dscTarea': tasks[i].dscTarea,
                      'fechaEnt': tasks[i].fechaEnt
                    });
                  }),
            ));
  }
}
