import 'dart:async';
import 'package:flutter/material.dart';
import 'package:miprocesoapp/main.dart';
import 'package:miprocesoapp/utils/connection_status/check_internet_conection_util.dart'; 

class ConnectionStatusProvider extends ChangeNotifier {
  // Declare a StreamSubscription to listen to the internet connectivity status
  late StreamSubscription _connectionSubscription;

  // Initialize the status to be online
  ConnectionStatus status = ConnectionStatus.online; 

  ConnectionStatusProvider() {
    // Listen to the stream of internet connection status
    _connectionSubscription = internetChecker 
        .internetStatus()
        .listen((newStatus) {
      // Update the status with the new status received
      status = newStatus; 
      // Notify all the listeners about the change in the status
      notifyListeners(); 
    });
  }

  @override
  // Method for disposing of the subscription
  void dispose() { 
    // Cancel the subscription to avoid memory leaks
    _connectionSubscription.cancel(); 
    super.dispose();
  }
}