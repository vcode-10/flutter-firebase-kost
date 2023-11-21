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
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyA89kkrzTMy0TXqG9ShY85kd1tQ-AQkeg4',
    appId: '1:394496797826:web:7151e79bed1df7025c989b',
    messagingSenderId: '394496797826',
    projectId: 'flutterkost',
    authDomain: 'flutterkost.firebaseapp.com',
    databaseURL: 'https://flutterkost-default-rtdb.firebaseio.com',
    storageBucket: 'flutterkost.appspot.com',
    measurementId: 'G-15T2MQ6JC5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDyRK4Yj1runiw3e28-wH4zpKWpIfoHYeE',
    appId: '1:394496797826:android:05397f97f25faca85c989b',
    messagingSenderId: '394496797826',
    projectId: 'flutterkost',
    databaseURL: 'https://flutterkost-default-rtdb.firebaseio.com',
    storageBucket: 'flutterkost.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCBcLsBLbiu8xhyt8uC00nk_q0yxa276zE',
    appId: '1:394496797826:ios:48be08eadf8889125c989b',
    messagingSenderId: '394496797826',
    projectId: 'flutterkost',
    databaseURL: 'https://flutterkost-default-rtdb.firebaseio.com',
    storageBucket: 'flutterkost.appspot.com',
    iosBundleId: 'com.example.projectkost',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCBcLsBLbiu8xhyt8uC00nk_q0yxa276zE',
    appId: '1:394496797826:ios:1f1923580147817e5c989b',
    messagingSenderId: '394496797826',
    projectId: 'flutterkost',
    databaseURL: 'https://flutterkost-default-rtdb.firebaseio.com',
    storageBucket: 'flutterkost.appspot.com',
    iosBundleId: 'com.example.projectkost.RunnerTests',
  );
}
