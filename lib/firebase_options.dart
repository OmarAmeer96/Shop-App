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
    apiKey: 'AIzaSyBhSjTIGQ9Ku7h8VD7Htqj_0ndHbfSRlbk',
    appId: '1:589996413736:web:8cbd875dda3334047ab61d',
    messagingSenderId: '589996413736',
    projectId: 'shop-app-d36f3',
    authDomain: 'shop-app-d36f3.firebaseapp.com',
    storageBucket: 'shop-app-d36f3.appspot.com',
    measurementId: 'G-38H5LTFFNZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBG-N3U6nr-gJazYIFEPyqDdkPOdcFA2GA',
    appId: '1:589996413736:android:a5039d714f2c03927ab61d',
    messagingSenderId: '589996413736',
    projectId: 'shop-app-d36f3',
    storageBucket: 'shop-app-d36f3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB-f1XsgdsClF8TBZbXuB3dwEHNs1wYQ3c',
    appId: '1:589996413736:ios:db331ecb10b20e3d7ab61d',
    messagingSenderId: '589996413736',
    projectId: 'shop-app-d36f3',
    storageBucket: 'shop-app-d36f3.appspot.com',
    iosClientId: '589996413736-kv71o6eqipp16rke4g4kj340p1maitbj.apps.googleusercontent.com',
    iosBundleId: 'com.example.shopApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB-f1XsgdsClF8TBZbXuB3dwEHNs1wYQ3c',
    appId: '1:589996413736:ios:540c28f8611ee8db7ab61d',
    messagingSenderId: '589996413736',
    projectId: 'shop-app-d36f3',
    storageBucket: 'shop-app-d36f3.appspot.com',
    iosClientId: '589996413736-f7spl10gmf248h756jt99jimribq48gf.apps.googleusercontent.com',
    iosBundleId: 'com.example.shopApp.RunnerTests',
  );
}
