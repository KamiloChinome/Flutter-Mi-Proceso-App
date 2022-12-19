import 'package:flutter/material.dart';

class ProcessDrawerModel{
  String title;
  IconData icon;
  ProcessDrawerModel({required this.title, required this.icon});
}

List<ProcessDrawerModel> processDraweritems = [
  ProcessDrawerModel(title: 'Agregar Proceso', icon: Icons.playlist_add),
  ProcessDrawerModel(title: 'Agregar a favoritos', icon: Icons.star),
  ProcessDrawerModel(title: 'Agregar actuación', icon: Icons.add),
  ProcessDrawerModel(title: 'Información', icon: Icons.info_outline),
  ProcessDrawerModel(title: 'Documentos', icon: Icons.description_outlined),
];