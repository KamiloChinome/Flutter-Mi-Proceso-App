import 'package:flutter/material.dart';
import 'package:miprocesoapp/utils/theme/themes.dart';
import 'package:miprocesoapp/utils/values/colors.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeData currentTheme;
  IconData selectedIconTheme = Icons.nightlight_round_outlined;
  Color iconColor;

  ThemeProvider({
    required bool darkMode
  }) : 
  currentTheme = darkMode ? darkTheme : lightTheme,
  iconColor = darkMode ? blanco : negro;

  setLightMode() {
    iconColor = negro;
    currentTheme = lightTheme;
    selectedIconTheme = Icons.nightlight_round_outlined;
    notifyListeners();
  }
  setDarckMode() {
    iconColor = blanco;
    currentTheme = darkTheme;
    selectedIconTheme = Icons.sunny;
    
    notifyListeners();
  }


}