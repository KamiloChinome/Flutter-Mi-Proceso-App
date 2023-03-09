import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static bool _darkMode = false;

  static Future init() async { 
    _prefs = await SharedPreferences.getInstance(); 
  }

  static bool get darkMode { 
    return _prefs.getBool('darkMode') ?? _darkMode; 
  }

  static set darkMode(bool value) { 
    _darkMode = value; 
    _prefs.setBool('darkMode', value); 
  }
}