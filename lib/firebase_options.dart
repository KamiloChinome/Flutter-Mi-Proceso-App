// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBJpbDljwbJ-xi534YIfEe49J7rD3VO6hw',
    appId: '1:480764972806:android:75cc1142de7182d6219887',
    messagingSenderId: '480764972806',
    projectId: 'jiacp-legalapp-development',
    databaseURL: 'https://jiacp-legalapp-development.firebaseio.com',
    storageBucket: 'jiacp-legalapp-development.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAeJIKbirHJSgzO_U942QVebsE38Vx3das',
    appId: '1:480764972806:ios:6de1ad1dc5770d79219887',
    messagingSenderId: '480764972806',
    projectId: 'jiacp-legalapp-development',
    databaseURL: 'https://jiacp-legalapp-development.firebaseio.com',
    storageBucket: 'jiacp-legalapp-development.appspot.com',
    androidClientId: '480764972806-6apf537mo6j6q1bje2eqnagedg5ks5fr.apps.googleusercontent.com',
    iosClientId: '480764972806-ihc9k3c292b0onhaalffsq9iqlfg917r.apps.googleusercontent.com',
    iosBundleId: 'com.example.miprocesoapp',
  );
}
