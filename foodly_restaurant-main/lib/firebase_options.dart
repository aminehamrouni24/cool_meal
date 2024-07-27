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
    apiKey: 'AIzaSyC1RaMCtPQc1jSue6vVkjrj6DN9llrHPiA',
    appId: '1:478084903744:android:5e309e0b546008b8c100a5',
    messagingSenderId: '478084903744',
    projectId: 'flutter-foodly-final-7d6ce',
    databaseURL: 'https://flutter-foodly-final-7d6ce-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'flutter-foodly-final-7d6ce.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDU_rnJN60KQiMFSYIJvTU6hTAGU3p5uk0',
    appId: '1:478084903744:ios:4087adb6e0103045c100a5',
    messagingSenderId: '478084903744',
    projectId: 'flutter-foodly-final-7d6ce',
    databaseURL: 'https://flutter-foodly-final-7d6ce-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'flutter-foodly-final-7d6ce.appspot.com',
    iosClientId: '478084903744-sd6gpfnqo84igkdod850apanpu50716a.apps.googleusercontent.com',
    iosBundleId: 'com.dbestech.foodlyRestaurant',
  );
}
