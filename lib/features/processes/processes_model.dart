import 'package:flutter/material.dart';
class ProcessDrawerModel{
  IconData icon;
  ProcessDrawerModel({required this.icon});
}

List<ProcessDrawerModel> processDraweritems = [
  ProcessDrawerModel( icon: Icons.playlist_add),
  ProcessDrawerModel( icon: Icons.star),
  ProcessDrawerModel( icon: Icons.add),
  ProcessDrawerModel( icon: Icons.info_outline),
  ProcessDrawerModel( icon: Icons.description_outlined),
];