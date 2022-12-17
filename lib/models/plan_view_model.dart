import 'package:flutter/material.dart';

class PlansIndexModel with ChangeNotifier{

  double _currentPage = 0;
  int _index = 0;

  double get currentPage => _currentPage;
  set currentPage(double i) {
    _currentPage = i;
    notifyListeners();
  }

  int get index => _index;
  set index(int i) {
    _index = i;
    notifyListeners();
  }
}