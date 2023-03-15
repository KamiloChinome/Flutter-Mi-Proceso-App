import 'package:flutter/material.dart';

import '../utils/values/info.dart';
import '../widgets/process_card.dart';

class ChangeListProvider with ChangeNotifier{
  int _selectedButton = 0;
  List<ProcessItem> _list = allItems;
  String _text = 'todos los procesos';

  String get text => _text;
  set text(String text){
    _text = text;
    notifyListeners();
  }

  List<ProcessItem> get list => _list;
  set list(List<ProcessItem> list){
    _list = list;
    notifyListeners();
  }

  int get selectedButton => _selectedButton;
  set selectedButton(int i){
    _selectedButton = i;
    notifyListeners();
  }
}

