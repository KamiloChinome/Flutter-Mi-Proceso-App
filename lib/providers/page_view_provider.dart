import 'package:flutter/material.dart';

class PageViewProvider extends ChangeNotifier{
  int _page= 2;

  int get page => _page;
  set page(int num){
    _page = num;
    notifyListeners();
  }


}