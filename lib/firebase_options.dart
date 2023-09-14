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
    apiKey: 'AIzaSyB2D21GF3IjFOsh7EEy5Gtdd0hDVVGETD8',
    appId: '1:1033214008641:web:72ad1240d6ede4432355c0',
    messagingSenderId: '1033214008641',
    projectId: 'myfoodapp-f5b1f',
    authDomain: 'myfoodapp-f5b1f.firebaseapp.com',
    storageBucket: 'myfoodapp-f5b1f.appspot.com',
    measurementId: 'G-QGC91XQX0Y',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCjCwcWXAjYjyiutJjTU7gPFnpb2p4go9E',
    appId: '1:1033214008641:android:1ba77d04ea408c7b2355c0',
    messagingSenderId: '1033214008641',
    projectId: 'myfoodapp-f5b1f',
    storageBucket: 'myfoodapp-f5b1f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAuy87uqfnrPTzCP9dV6UfX8ZG8PVRZTfo',
    appId: '1:1033214008641:ios:5c4ccc48f71f8a5d2355c0',
    messagingSenderId: '1033214008641',
    projectId: 'myfoodapp-f5b1f',
    storageBucket: 'myfoodapp-f5b1f.appspot.com',
    iosClientId: '1033214008641-8cjdmgjccodumib11fajptlg1u380737.apps.googleusercontent.com',
    iosBundleId: 'com.example.myFoodApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAuy87uqfnrPTzCP9dV6UfX8ZG8PVRZTfo',
    appId: '1:1033214008641:ios:0b792af0fb6da6752355c0',
    messagingSenderId: '1033214008641',
    projectId: 'myfoodapp-f5b1f',
    storageBucket: 'myfoodapp-f5b1f.appspot.com',
    iosClientId: '1033214008641-n1orjkmeg6a7hp8e7rcpekt5uu7olnbn.apps.googleusercontent.com',
    iosBundleId: 'com.example.myFoodApp.RunnerTests',
  );
}
