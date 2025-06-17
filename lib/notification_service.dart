import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    tz.initializeTimeZones();

    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const initSettings = InitializationSettings(android: androidSettings);

    await notificationsPlugin.initialize(initSettings);
  }

  Future<void> scheduleHourlyBirthdayNotifications() async {
    final now = tz.TZDateTime.now(tz.local);
    const birthdayDate = 19;

    if (now.month == 6 && now.day == birthdayDate) return; // Already June 19

    await notificationsPlugin.cancelAll(); // Clear any previous

    final messages = [
      "🎉 Your birthday day has begun!",
      "🎂 Here's a slice of happiness!",
      "💫 Wishing you magic every hour!",
      "🌈 You shine bright today!",
      "🎁 Another hour, another blessing!",
      "🦄 You’re loved more than you know!",
      "✨ Sending sparkles your way!",
      "🕗 Keep smiling, birthday star!",
      "🌸 You're blooming with joy!",
      "☀️ Shine all day long!",
      "🍬 Sugar, spice, and birthday vibes!",
      "🎈 Time for fun and giggles!",
      "💖 Heart full of joy?",
      "🍫 Sweet treats incoming!",
      "🌟 You're a birthday legend!",
      "🎵 Time for another dance!",
      "🍰 Hope your wish is big!",
      "🧸 You’re the cutest today!",
      "🎇 It's still YOUR day!",
      "🍭 Hourly joy unlocked!",
      "🐣 Stay cheerful, sunshine!",
      "🎀 Wrapped in love!",
      "🌠 Make a magical wish!",
      "🌙 Ending the day with a smile!",
    ];

    for (int hour = 0; hour < 24; hour++) {
      final scheduledTime = tz.TZDateTime(
        tz.local,
        now.year,
        6,
        birthdayDate,
        hour,
      );

      await notificationsPlugin.zonedSchedule(
        hour, // ID
        "🎉 Birthday Surprise!",
        messages[hour],
        scheduledTime,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'birthday_channel',
            'Birthday Notifications',
            channelDescription: 'Cute hourly birthday wishes on 19th June',
            importance: Importance.high,
            priority: Priority.high,
          ),
        ),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.dateAndTime,
      );
    }
  }
}
