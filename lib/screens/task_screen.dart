import 'package:flutter/material.dart';
import 'package:practica1/database/database_helper.dart';
import 'package:practica1/providers/providers.dart';
import 'package:practica1/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../decorations/input_decorations.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final taskForm = Provider.of<TaskProvider>(context);
    final RoundedLoadingButtonController btnController =
        RoundedLoadingButtonController();
    bool ban = false;
    if (ModalRoute.of(context)!.settings.arguments != null) {
      ban = true;
      final tarea = ModalRoute.of(context)?.settings.arguments as Map;
      taskForm.txtFecha = tarea['fechaEnt'];
      taskForm.txtDesc = tarea['dscTarea'];
      taskForm.id = tarea['idTarea'];
    }
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text(!ban ? 'Add task' : 'Upate task'),
        ),
        body: ListView(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
            children: [
              Form(
                key: taskForm.formkey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    TextFormField(
                        style: const TextStyle(color: Colors.black),
                        autocorrect: false,
                        initialValue: !ban ? '' : taskForm.txtFecha,
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecorations.authInputDecorations(
                            labelText: 'Date', prefixIcon: Icons.date_range),
                        onChanged: (value) => taskForm.txtFecha = value),
                    const SizedBox(height: 10),
                    TextFormField(
                        style: const TextStyle(color: Colors.black),
                        autocorrect: false,
                        initialValue: !ban ? '' : taskForm.txtDesc,
                        keyboardType: TextInputType.text,
                        maxLines: 6,
                        decoration: InputDecorations.authInputDecorations(
                            labelText: 'Description',
                            prefixIcon: Icons.document_scanner),
                        onChanged: (value) {
                          taskForm.txtDesc = value;
                          print(taskForm.txtDesc);
                        }),
                    RoundedLoadingButton(
                      color: const Color.fromARGB(255, 185, 0, 121),
                      borderRadius: 10,
                      controller: btnController,
                      errorColor: Colors.red,
                      onPressed: () async {
                        if (!ban) {
                          await taskForm
                              .newTask(taskForm.txtDesc, taskForm.txtFecha)
                              .then((value) {
                            final snackBar = SnackBar(
                                content: Text(
                                    'Tarea registrada correctamente ${value.dscTarea}'));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            Navigator.pop(context);
                          });
                        } else {
                          print(
                              '${taskForm.txtDesc} ${taskForm.txtFecha} ${taskForm.id}');
                          await DatabaseHelper.db.actualizar(
                            {
                              'dscTarea': taskForm.txtDesc,
                              'fechaEnt': taskForm.txtFecha,
                              'idTarea': taskForm.id
                            },
                            'tblTareas',
                          )
                              // taskForm
                              //     .actualizar(taskForm.txtDesc, taskForm.txtFecha,
                              //         taskForm.id)
                              .then((value) {
                            final snackBar = SnackBar(
                                content:
                                    Text('Tarea actualizada correctamente'));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            Navigator.pop(context);
                          });
                        }
                      },
                      child: Text(!ban ? 'Add task' : 'Upate task'),
                    ),
                  ],
                ),
              ),
            ]));
  }
}
