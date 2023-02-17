// The given code defines a Flutter Provider class named CounterProvider, which extends the ChangeNotifier class.
// This class can be used to manage and update the state of a counter variable.
// The CounterProvider class contains a private variable named _counterLength, which is initially
// set to '0'. The class also includes a getter method called counterLength, which returns the value of
// _counterLength, and a setter method called counterLength, which sets the value of _counterLength to the
// parameter passed to it and calls notifyListeners() to notify any listeners that the state has been updated.
// By using this provider, any widgets that depend on the counter state can be rebuilt when the state changes,
// ensuring that the UI is always up-to-date with the current counter value.
import 'package:flutter/material.dart';
class CounterProvider with ChangeNotifier{
  String _counterLenght = '0';

  String get counterLenght => _counterLenght;
  set counterLenght(String i){
    _counterLenght = i;
    notifyListeners();
  }
}