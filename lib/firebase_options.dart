// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyCcvFVDsVU6hz1fjVU2Nm62fZmd4zhGwkQ',
    appId: '1:1072553956634:web:c415509fcc491f7f9508a3',
    messagingSenderId: '1072553956634',
    projectId: 'test-project-639e0',
    authDomain: 'test-project-639e0.firebaseapp.com',
    storageBucket: 'test-project-639e0.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCgR51JZIvRwy7hsDgPCmCtrJgoVm9HCDQ',
    appId: '1:1072553956634:android:7433633a2d2a451a9508a3',
    messagingSenderId: '1072553956634',
    projectId: 'test-project-639e0',
    storageBucket: 'test-project-639e0.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBb04o-RZS9XZoMNACZZtTOSFHoT2PPAsU',
    appId: '1:1072553956634:ios:cbafa4bbc34433b59508a3',
    messagingSenderId: '1072553956634',
    projectId: 'test-project-639e0',
    storageBucket: 'test-project-639e0.firebasestorage.app',
    iosBundleId: 'com.example.loginSignup',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBb04o-RZS9XZoMNACZZtTOSFHoT2PPAsU',
    appId: '1:1072553956634:ios:cbafa4bbc34433b59508a3',
    messagingSenderId: '1072553956634',
    projectId: 'test-project-639e0',
    storageBucket: 'test-project-639e0.firebasestorage.app',
    iosBundleId: 'com.example.loginSignup',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCcvFVDsVU6hz1fjVU2Nm62fZmd4zhGwkQ',
    appId: '1:1072553956634:web:79247e615ee903619508a3',
    messagingSenderId: '1072553956634',
    projectId: 'test-project-639e0',
    authDomain: 'test-project-639e0.firebaseapp.com',
    storageBucket: 'test-project-639e0.firebasestorage.app',
  );
}
