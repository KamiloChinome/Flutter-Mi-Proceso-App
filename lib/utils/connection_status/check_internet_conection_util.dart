// The following code sets up a class called CheckInternetConnection, which uses the connectivity_plus
// and rxdart packages to monitor and report changes in the device's network connectivity status.
// The class defines an enum called ConnectionStatus to represent the possible states of the device's internet connectivity: online and offline.
// The class also creates a BehaviorSubject instance called _controller to manage the state of the device's internet connectivity.
// It listens for connectivity changes using a StreamSubscription created from the onConnectivityChanged stream of the _connectivity object.
// The internetStatus() method returns a Stream of ConnectionStatus objects that can be listened to in order to get updates on the device's internet
// connectivity status. It also sets up the _connectionSubscription property to listen for network connectivity changes and calls
// the _checkInternetConnection() method to check the current connectivity status.
// The _checkInternetConnection() method uses the InternetAddress.lookup method to try and resolve the IP address of 'google.com'
// and determine if there is an active internet connection. If the lookup is successful and the result is not empty, the _controller
// sends an online status. Otherwise, if the lookup fails, _controller sends an offline status.
// Finally, the close() method cancels the _connectionSubscription and closes the _controller. This is necessary to prevent memory leaks
// and ensure that the class is properly disposed of when it is no longer needed.
import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:rxdart/rxdart.dart';


enum ConnectionStatus {
  online,
  offline,
}
class CheckInternetConnection {

  final Connectivity _connectivity = Connectivity();


  final _controller = BehaviorSubject.seeded(ConnectionStatus.online);

  StreamSubscription? _connectionSubscription;

  CheckInternetConnection() {
    _checkInternetConnection();
  }

  Stream<ConnectionStatus> internetStatus() {
    _connectionSubscription ??= _connectivity.onConnectivityChanged
    .listen((_) => _checkInternetConnection());

    return _controller.stream;
  }

  Future<void> _checkInternetConnection() async {
    try {
      // Wait for 3 seconds
      await Future.delayed(const Duration(seconds: 3));
      final result = await InternetAddress.lookup('google.com');
      if(result.isNotEmpty && result[0].rawAddress.isNotEmpty){
        _controller.sink.add(ConnectionStatus.online);
      }else{
        _controller.sink.add(ConnectionStatus.offline);
      }
    } on SocketException catch (_) {
      _controller.sink.add(ConnectionStatus.offline);
    }
  }
  // A method to cancel the subscription and close the stream controller
  Future<void> close() async {
    await _connectionSubscription?.cancel();
    await _controller.close();
  }
}
