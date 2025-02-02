import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // Generated options
  );

  configureFirebaseMessaging();

  runApp(MyApp());
}

//yt7to fi el main page

void configureFirebaseMessaging() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission();

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission');
  } else {
    print('User declined or has not accepted permission');
  }

  // Background message handler
  FirebaseMessaging.onBackgroundMessage(_backgroundMessageHandler);
}

Future<void> _backgroundMessageHandler(RemoteMessage message) async {
  print('Handling background message: ${message.notification?.title}');
}




class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: Scaffold(
        appBar: AppBar(title: Text('Firebase Messaging Example')),
        body: Center(child: Text('Welcome to Flutter!')),
      ),
    );
  }
}
