class TareasDAO {
  int? idTarea;
  String? dscTarea;
  String? fechaEnt;

  TareasDAO({this.idTarea, this.dscTarea, this.fechaEnt});
  factory TareasDAO.fromJSON(Map<String, dynamic> mapTarea) {
    return TareasDAO(
      idTarea: mapTarea['idTarea'],
      dscTarea: mapTarea['dscTarea'],
      fechaEnt: mapTarea['fechaEnt'],
    );
  }
}
