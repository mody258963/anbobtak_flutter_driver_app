import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pusher_beams/pusher_beams.dart';

import 'presntation_lyar/widgets/app_router.dart';

String? initialRoute;
String? ids;

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // This will handle background notifications
  print('Handling a background message: ${message.messageId}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  
  // Initialize Firebase
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyASmpa4YmxIBRbVL_TM1PpOGjW2jC2R7UQ",
      authDomain: "flutter-geolocation-9f4c3.firebaseapp.com",
      projectId: "anbobtak-d2b94",
      storageBucket: "anbobtak-d2b94.appspot.com",
      messagingSenderId: "75152996159",
      appId: '1:75152996159:android:ab7762f2b7740c9971c58a',
    ),
  );

  // Initialize Pusher Beams
  await PusherBeams.instance.start('24340098-8055-4e3b-bd3b-a6c713edadcd');
  await PusherBeams.instance.addDeviceInterest('client_1');

  // Request Notification Permissions
  PermissionStatus status = await Permission.notification.request();
  if (status.isGranted) {
    // Set up Firebase Messaging
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    // Set up background message handler
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // Request the FCM token (can be useful for debugging)
    String? token = await messaging.getToken();
    print("FCM Token: $token");

    // Listen for foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Received a message in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message has a notification: ${message.notification!.title}, ${message.notification!.body}');
        _showNotification(message.notification!);
      }
    });

    // Listen for messages when the app is in background but not terminated
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A message was opened: ${message.messageId}');
      // Navigate to a specific screen if needed
    });

    runApp(MyApp(
      appRouter: AppRouter(),
    ));
  } else {
    // Handle permission denial
    print('Notification permission denied');
  }
}

void _showNotification(RemoteNotification notification) async {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
          'your_channel_id', 'your_channel_name',
          channelDescription: 'your_channel_description',
          importance: Importance.high,
          priority: Priority.high,
          ticker: 'ticker', 
);
  const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);

  await flutterLocalNotificationsPlugin.show(
      0, notification.title, notification.body, platformChannelSpecifics,
      payload: 'item x');
}


class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
      initialRoute: initialRoute,
    );
  }
}
