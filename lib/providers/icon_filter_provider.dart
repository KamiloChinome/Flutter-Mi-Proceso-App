// The given code defines a Flutter provider class named IconFilterprovider,
// which extends the ChangeNotifier class. This provider class can be used to manage and update
// the state of an icon that can be used as a filter.
// The class contains a private variable named _selectedIcon that is initially set to the Icons.star icon.
// The class also includes a getter method called selectedIcon that returns the value of _selectedIcon,
// and a setter method called selectedIcon that sets the value of _selectedIcon to the icon passed as a
// parameter and calls notifyListeners() to notify any listeners that the state has been updated.
// By using this provider, any widgets that depend on the selected icon state can be rebuilt when the
// state changes, ensuring that the UI is always up-to-date with the current selected icon value.
import 'package:flutter/material.dart';
class IconFilterprovider with ChangeNotifier{
  IconData _selectedIcon = Icons.star;

  IconData get selectedIcon => _selectedIcon;
  set selectedIcon(IconData i){
    _selectedIcon = i;
    notifyListeners();
  }
}