import 'package:flutter/material.dart';

import '../../utils/values/info.dart';
import 'process_card.dart';

class ChangeListProvider with ChangeNotifier{
  int _selectedButton = 0;
  List<ProcessItemWidget> _list = allItems;
  String _text = 'todos los procesos';

  String get text => _text;
  set text(String text){
    _text = text;
    notifyListeners();
  }

  List<ProcessItemWidget> get list => _list;
  set list(List<ProcessItemWidget> list){
    _list = list;
    notifyListeners();
  }

  int get selectedButton => _selectedButton;
  set selectedButton(int i){
    _selectedButton = i;
    notifyListeners();
  }
}

