import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs; // Declare a static instance of SharedPreferences

  static bool _darkMode = false; // Declare a static boolean variable for dark mode

  static Future init() async { // Initialize the shared preferences instance
    _prefs = await SharedPreferences.getInstance(); // Get the instance of shared preferences
  }

  static bool get darkMode { // Get the value of the dark mode preference
    return _prefs.getBool('darkMode') ?? _darkMode; // Return the stored value if it exists, otherwise return the default value of false
  }

  static set darkMode(bool value) { // Set the value of the dark mode preference
    _darkMode = value; // Update the value of the boolean variable
    _prefs.setBool('darkMode', value); // Store the new value in the shared preferences
  }
}