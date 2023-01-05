class ProcessInformationModel{
  String title;
  String subtitle;
  ProcessInformationModel({required this.title, required this.subtitle});
}

List<ProcessInformationModel> processInformationModel = [
  ProcessInformationModel(title: 'SIGUIENTE EVENTO',subtitle: 'Eventos pendientes'),
  ProcessInformationModel(title: 'ULTIMO EVENTO',subtitle: 'Evento anterior'),
  ProcessInformationModel(title: 'DESPACHO',subtitle: 'Lugar de despacho'),
  ProcessInformationModel(title: 'PONENTE',subtitle: 'Nombre del ponente'),
  ProcessInformationModel(title: 'TIPO',subtitle: 'Tipo del proceso'),
  ProcessInformationModel(title: 'CLASE',subtitle: 'Clase del proceso'),
  ProcessInformationModel(title: 'RECURSO',subtitle: 'Tipo de recurso'),
  ProcessInformationModel(title: 'UBICACION DEL ARCHIVO',subtitle: 'Ubicacion del archivo'),
  ProcessInformationModel(title: 'DEMANDANTE(S) / ACCIONANTES(S)',subtitle: 'Demandante o accionante'),
  ProcessInformationModel(title: 'DEMANDADO(S) / ACCIONADO(S)',subtitle: 'Demandado o accionado'),
  ProcessInformationModel(title: 'CONTENIDO',subtitle: 'Contenido'),
];

