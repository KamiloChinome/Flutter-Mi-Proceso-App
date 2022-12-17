import 'package:flutter/material.dart';

class PageViewModel extends ChangeNotifier{
  int _page= 2;

  int get page => _page;
  set page(int num){
    _page = num;
    notifyListeners();
  }


}