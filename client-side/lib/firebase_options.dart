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
    apiKey: 'AIzaSyB63j0GL7FZ60rDmOle3zr02HIPxu48KDE',
    appId: '1:602561978471:web:d6d543176640d27d17f4c2',
    messagingSenderId: '602561978471',
    projectId: 'tagumpai-2bad6',
    authDomain: 'tagumpai-2bad6.firebaseapp.com',
    storageBucket: 'tagumpai-2bad6.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD6831xE-YL9giNHBVsbxhTrPTj4tv-yBY',
    appId: '1:602561978471:android:aad0a44913fb061717f4c2',
    messagingSenderId: '602561978471',
    projectId: 'tagumpai-2bad6',
    storageBucket: 'tagumpai-2bad6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDaUwXKSSfqUlSuuIHzcMpxY8lPx5494a8',
    appId: '1:602561978471:ios:79c93d23347ee46d17f4c2',
    messagingSenderId: '602561978471',
    projectId: 'tagumpai-2bad6',
    storageBucket: 'tagumpai-2bad6.appspot.com',
    androidClientId: '602561978471-mavd7q7ng4p1tndlcks9ajf4akdjouqs.apps.googleusercontent.com',
    iosClientId: '602561978471-6l2vkk85u4o39hiumo777i0r90rbru72.apps.googleusercontent.com',
    iosBundleId: 'com.example.tagumpai',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDaUwXKSSfqUlSuuIHzcMpxY8lPx5494a8',
    appId: '1:602561978471:ios:79c93d23347ee46d17f4c2',
    messagingSenderId: '602561978471',
    projectId: 'tagumpai-2bad6',
    storageBucket: 'tagumpai-2bad6.appspot.com',
    androidClientId: '602561978471-mavd7q7ng4p1tndlcks9ajf4akdjouqs.apps.googleusercontent.com',
    iosClientId: '602561978471-6l2vkk85u4o39hiumo777i0r90rbru72.apps.googleusercontent.com',
    iosBundleId: 'com.example.tagumpai',
  );
}