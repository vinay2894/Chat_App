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
    apiKey: 'AIzaSyDJX_d2s6DYQUCJC8L3aogcwaua8aoTsgo',
    appId: '1:320770099180:web:161fce2d39b208cbd6e2c9',
    messagingSenderId: '320770099180',
    projectId: 'chat-app-4b013',
    authDomain: 'chat-app-4b013.firebaseapp.com',
    storageBucket: 'chat-app-4b013.appspot.com',
    measurementId: 'G-97VQBBXFF6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCgRh0ZmCZViCrwp2p_t3iz2w7rrj1NI2g',
    appId: '1:320770099180:android:4a2cf6ef38bf4973d6e2c9',
    messagingSenderId: '320770099180',
    projectId: 'chat-app-4b013',
    storageBucket: 'chat-app-4b013.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBgxraz-4VtMxsiUsIgMeC0jeTnOC-gGQ4',
    appId: '1:320770099180:ios:e6cfbb9568d3f255d6e2c9',
    messagingSenderId: '320770099180',
    projectId: 'chat-app-4b013',
    storageBucket: 'chat-app-4b013.appspot.com',
    iosBundleId: 'com.example.igDatabase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBgxraz-4VtMxsiUsIgMeC0jeTnOC-gGQ4',
    appId: '1:320770099180:ios:1221e2b125c4faf6d6e2c9',
    messagingSenderId: '320770099180',
    projectId: 'chat-app-4b013',
    storageBucket: 'chat-app-4b013.appspot.com',
    iosBundleId: 'com.example.igDatabase.RunnerTests',
  );
}
