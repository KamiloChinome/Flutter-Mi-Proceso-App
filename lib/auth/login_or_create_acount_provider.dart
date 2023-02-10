import 'package:flutter/material.dart';

class LogInOrCreateAnAcountProvider with ChangeNotifier{
  bool _visible = true; 

  bool get visible => _visible;
  set visible(bool i){
    _visible = i;
    notifyListeners();
  }
}