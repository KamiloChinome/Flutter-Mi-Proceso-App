import 'package:flutter/material.dart';
class IconFilterprovider with ChangeNotifier{
  IconData _selectedIcon = Icons.star;

  IconData get selectedIcon => _selectedIcon;
  set selectedIcon(IconData i){
    _selectedIcon = i;
    notifyListeners();
  }
}