import 'package:flutter/material.dart';

class AddProcessSwichProvider with ChangeNotifier{
  bool _swich = false; 

  bool get swich => _swich;
  set swich(bool i){
    _swich = i;
    notifyListeners();
  }
}