import 'package:flutter/material.dart';
import 'package:miprocesoapp/screens/process_screen.dart';
import 'package:miprocesoapp/values/texts.dart';
import 'package:miprocesoapp/widgets/process_card.dart';

final citys = <String>[
  'APARTADO','ARAUCA',
  'ARMENIA','BARRANCABERMEJA',
  'BARRANQUILLA','BELLO',
  'BOGOTA, D.C','BUCARAMANGA',
  'BUGA','CALI',
  'CARTAGENA','CAUCASIA',
  'CUCUTA','DUITAMA',
  'EL CARMEN DE BOLIVAR','ENVIGADO',
  'FLORENCIA','IBAGUE',
  'ITAGUI','MANIZALES',
  'MEDELLIN','MOCOA',
  'MONTERIA','NEIVA',
  'PALMIRA','PAMPLONA',
  'PASTO','PEREIRA',
  'POPAYAN','QUIBDO',
  'RIOHACHA','RIONEGRO',
  'SAN GIL','SANTA MARTA',
  'SANTA ROSA DE VITERBO','SINCELEJO',
  'SOGAMOSO','TUMACO',
  'TUNJA','VALLEDUPAR',
  'VILLAVICENCIO','YOPAL',
];

final allItems = [
  const ProcessItem(defendant: defendant,demanding: demanding,processId: processId,processUbication: processUbication,),
  const ProcessItem(defendant: defendant,demanding: demanding,processId: processId,processUbication: processUbication,),
  const ProcessItem(defendant: defendant,demanding: demanding,processId: processId,processUbication: processUbication,),
  const ProcessItem(defendant: defendant,demanding: demanding,processId: processId,processUbication: processUbication,),
  const ProcessItem(defendant: defendant,demanding: demanding,processId: processId,processUbication: processUbication,),
  const ProcessItem(defendant: defendant,demanding: demanding,processId: processId,processUbication: processUbication,),
  const ProcessItem(defendant: defendant,demanding: demanding,processId: processId,processUbication: processUbication,),
  const ProcessItem(defendant: defendant,demanding: demanding,processId: processId,processUbication: processUbication,),
  const ProcessItem(defendant: defendant,demanding: demanding,processId: processId,processUbication: processUbication,),
  const ProcessItem(defendant: defendant,demanding: demanding,processId: processId,processUbication: processUbication,),
  const ProcessItem(defendant: defendant,demanding: demanding,processId: processId,processUbication: processUbication,),
  const ProcessItem(defendant: defendant,demanding: demanding,processId: processId,processUbication: processUbication,),
  const ProcessItem(defendant: defendant,demanding: demanding,processId: processId,processUbication: processUbication,),
];
final checkItems = [
  const ProcessItem(defendant: defendant,demanding: demanding,processId: processId,processUbication: processUbication,),
  const ProcessItem(defendant: defendant,demanding: demanding,processId: processId,processUbication: processUbication,),
  const ProcessItem(defendant: defendant,demanding: demanding,processId: processId,processUbication: processUbication,),
  const ProcessItem(defendant: defendant,demanding: demanding,processId: processId,processUbication: processUbication,),
];
final notCheckItems = [
  const ProcessItem(defendant: defendant,demanding: demanding,processId: processId,processUbication: processUbication,),
  const ProcessItem(defendant: defendant,demanding: demanding,processId: processId,processUbication: processUbication,),
  const ProcessItem(defendant: defendant,demanding: demanding,processId: processId,processUbication: processUbication,),
];
final updateItems = [
  const ProcessItem(defendant: defendant,demanding: demanding,processId: processId,processUbication: processUbication,),
  const ProcessItem(defendant: defendant,demanding: demanding,processId: processId,processUbication: processUbication,),
];

const List<Widget> nameAllServices = <Widget>[
  Expanded(child: Padding(
    padding: EdgeInsets.only(right: 25, left: 10),
    child: Text('Notificación de movimientos diarios via SMS',style: TextStyle(fontSize: 17), overflow: TextOverflow.ellipsis, maxLines: 2,),
  )),
  Expanded(child: Padding(
    padding: EdgeInsets.only(right: 25, left: 10),
    child: Text('Notificación de movimientos diarios via EMAIL',style: TextStyle(fontSize: 17), overflow: TextOverflow.ellipsis, maxLines: 2,),
  )),
  Expanded(child: Padding(
    padding: EdgeInsets.only(right: 25, left: 10),
    child: Text('Almacenamiento de documentos asociados a las actuaciones ilimitado', style: TextStyle(fontSize: 17), overflow: TextOverflow.ellipsis, maxLines: 2,),
  )),
  Expanded(child: Padding(
    padding: EdgeInsets.only(right: 25, left: 10),
    child: Text('Vinculación ilimitada de personas al proceso',style: TextStyle(fontSize: 17), overflow: TextOverflow.ellipsis, maxLines: 2,),
  )),

];

const List<String> planName = [
  'Nombre del plan 1',
  'Nombre del plan 2',
  'Nombre del plan 3',
];
const List<Color> color = [
  Colors.black,
  Colors.red,
  Colors.green,
];

const List<Widget> actuationsList = <Widget>[
  ProcessDetaillCard(),
  ProcessDetaillCard(),
  ProcessDetaillCard(),
  ProcessDetaillCard(),
  ProcessDetaillCard(),
  ProcessDetaillCard(),
  ProcessDetaillCard(),
  ProcessDetaillCard(),
  ProcessDetaillCard(),
  ProcessDetaillCard(),
  ProcessDetaillCard(),
  ProcessDetaillCard(),
  ProcessDetaillCard(),
  ProcessDetaillCard(),
  ProcessDetaillCard(),
];


