import 'package:flutter/material.dart';

class LogInAndSignUpProvider with ChangeNotifier{
  GlobalKey<FormState> logIn = GlobalKey<FormState>();
  GlobalKey<FormState> sigInUp = GlobalKey<FormState>();
  bool _visible = true; 
  bool _errorForm = false; 
  bool _isLoading = false; 
  String email = '';
  String password = '';
  
  bool get visible => _visible;
  set visible(bool i){
    _visible = i;
    notifyListeners();
  }
  bool get errorForm => _errorForm;
  set errorForm(bool value){
    _errorForm = value;
    notifyListeners();
  }
  bool get isLoading => _isLoading;
  set isLoading(bool value){
    _isLoading = value;
    notifyListeners();
  }

  bool isValidLogIn() {
    return logIn.currentState?.validate() ?? false;
  }
  bool isValidsigInUp() {
    return sigInUp.currentState?.validate() ?? false;
  }
}