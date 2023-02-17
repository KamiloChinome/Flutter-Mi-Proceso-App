// This code defines a Dart class named AddProcessSwichProvider that extends the ChangeNotifier class.
// The ChangeNotifier class is part of the Flutter framework and is used to manage state and notify any
// listeners of any state changes.
// The class has a private boolean instance variable _swich initialized to false.
// It also has a getter method called swich that returns the value of the _swich instance variable,
// and a setter method called swich that takes a boolean argument i. When the swich method is called,
// it sets the value of _swich to the value of the i argument and calls notifyListeners().
// This will notify any listeners that the value of _swich has been updated.
import 'package:flutter/material.dart';

class AddProcessSwichProvider with ChangeNotifier{
  bool _swich = false; 

  bool get swich => _swich;
  set swich(bool i){
    _swich = i;
    notifyListeners();
  }
}