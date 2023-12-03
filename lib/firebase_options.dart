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
/// 

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
    apiKey: 'AIzaSyDwAemgET7-wqobTTShHpZxhElaZwjcgb4',
    appId: '1:903461213974:web:3624d24b08012467b12237',
    messagingSenderId: '903461213974',
    projectId: 'bolt-953cb',
    authDomain: 'bolt-953cb.firebaseapp.com',
    databaseURL: 'https://bolt-953cb-default-rtdb.firebaseio.com',
    storageBucket: 'bolt-953cb.appspot.com',
    measurementId: 'G-ZHM4RPJZXK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCRH51OwzD4aLZkOmQUa9IwnyItCNEb6mE',
    appId: '1:903461213974:android:824807a04a14290db12237',
    messagingSenderId: '903461213974',
    projectId: 'bolt-953cb',
    databaseURL: 'https://bolt-953cb-default-rtdb.firebaseio.com',
    storageBucket: 'bolt-953cb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDvBgSOtjGR48-bYtP5WWxjJajoqG7tAVw',
    appId: '1:903461213974:ios:7986a8a752c394a0b12237',
    messagingSenderId: '903461213974',
    projectId: 'bolt-953cb',
    databaseURL: 'https://bolt-953cb-default-rtdb.firebaseio.com',
    storageBucket: 'bolt-953cb.appspot.com',
    iosClientId: '903461213974-vkj1tugdvahov15cgesbfvgst0cu7o79.apps.googleusercontent.com',
    iosBundleId: 'com.example.boltApplication',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDvBgSOtjGR48-bYtP5WWxjJajoqG7tAVw',
    appId: '1:903461213974:ios:be31243fba5dce75b12237',
    messagingSenderId: '903461213974',
    projectId: 'bolt-953cb',
    databaseURL: 'https://bolt-953cb-default-rtdb.firebaseio.com',
    storageBucket: 'bolt-953cb.appspot.com',
    iosClientId: '903461213974-jaihjln047oi1rlr4r5trjmihh00mqic.apps.googleusercontent.com',
    iosBundleId: 'com.example.boltApplication',
  );
}
