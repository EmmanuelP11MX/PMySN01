class TaskDAO {
  int? idTarea;
  String? dscTarea;
  String? fechaEnt;

  TaskDAO({this.idTarea, this.dscTarea, this.fechaEnt});
  factory TaskDAO.fromJSON(Map<String, dynamic> mapTarea) {
    return TaskDAO(
      idTarea: mapTarea['idTarea'],
      dscTarea: mapTarea['dscTarea'],
      fechaEnt: mapTarea['fechaEnt'],
    );
  }
}
