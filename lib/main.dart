import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'screens/welcome_screen.dart';
import 'screens/letter_screen.dart';
import 'notification_service.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> requestPermissions() async {
  await [
    Permission.notification,
    Permission.audio,
    Permission.storage,
    Permission.photos,
  ].request();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize timezones for scheduled notifications
  tz.initializeTimeZones();

  // Initialize notifications
  const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
  const initSettings = InitializationSettings(android: androidSettings);
  await flutterLocalNotificationsPlugin.initialize(initSettings);

  // Ask runtime permissions
  await requestPermissions();

  // Schedule 24 hourly birthday notifications on 19 June
  final notificationService = NotificationService();
  await notificationService.init();
  await notificationService.scheduleHourlyBirthdayNotifications();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Birthday Surprise 🎉',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Caveat',
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/letter': (context) => const LetterScreen(),
      },
    );
  }
}
