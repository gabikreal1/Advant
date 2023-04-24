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
    apiKey: 'AIzaSyCjXwJ6pyPtRp7F2llLmmq9LGJed8nurzg',
    appId: '1:75134287411:web:a58f422c9b80cf850f2d46',
    messagingSenderId: '75134287411',
    projectId: 'advantdating',
    authDomain: 'advantdating.firebaseapp.com',
    storageBucket: 'advantdating.appspot.com',
    measurementId: 'G-MYESPZEK4F',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAHYdGrPlwFbCmfcQyxsyv6pE-Ky6XeWgQ',
    appId: '1:75134287411:android:3cf71bfc9529370a0f2d46',
    messagingSenderId: '75134287411',
    projectId: 'advantdating',
    storageBucket: 'advantdating.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAQCIbm0by2TUnpLC3IOC2tIdl5noxoOgs',
    appId: '1:75134287411:ios:143393264ba4639e0f2d46',
    messagingSenderId: '75134287411',
    projectId: 'advantdating',
    storageBucket: 'advantdating.appspot.com',
    iosClientId: '75134287411-cudm8tb99pc94v82l93jsfeui34aap9f.apps.googleusercontent.com',
    iosBundleId: 'com.example.login',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAQCIbm0by2TUnpLC3IOC2tIdl5noxoOgs',
    appId: '1:75134287411:ios:143393264ba4639e0f2d46',
    messagingSenderId: '75134287411',
    projectId: 'advantdating',
    storageBucket: 'advantdating.appspot.com',
    iosClientId: '75134287411-cudm8tb99pc94v82l93jsfeui34aap9f.apps.googleusercontent.com',
    iosBundleId: 'com.example.login',
  );
}