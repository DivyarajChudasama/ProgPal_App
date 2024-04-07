import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('flutter_logo');

    var initializationSettingsIOS = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        onDidReceiveLocalNotification:
            (int id, String? title, String? body, String? payload) async {});

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    await notificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse:
            (NotificationResponse notificationResponse) async {});
  }

  NotificationDetails notificationDetails() {
    return const NotificationDetails(
        android: AndroidNotificationDetails('channelId', 'channelName',
            importance: Importance.max),
        iOS: DarwinNotificationDetails());
  }

  Future<void> showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async {
    await notificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails(),
    );
  }

  // Future<void> scheduleNotification({
  //   required String title,
  //   required String body,
  // }) async {
  //   // Get the current date
  //   final now = DateTime.now();

  //   // Set the notification time to 10:05 AM today
  //   final scheduledTimeToday = DateTime(now.year, now.month, now.day, 10, 30);

  //   // Check if the scheduled time has already passed for today
  //   if (now.isAfter(scheduledTimeToday)) {
  //     // If yes, schedule the notification for 10:05 AM tomorrow
  //     scheduledTimeToday.add(const Duration(days: 1));
  //   }

  //   // Schedule the notification
  //   await notificationsPlugin.zonedSchedule(
  //     0,
  //     title,
  //     body,
  //     tz.TZDateTime.from(scheduledTimeToday, tz.local),
  //     notificationDetails(),
  //     androidAllowWhileIdle: true,
  //     uiLocalNotificationDateInterpretation:
  //         UILocalNotificationDateInterpretation.absoluteTime,
  //     matchDateTimeComponents: DateTimeComponents.time,
  //     payload: 'Notification Payload',
  //   );
  // }
  Future<void> showSimpleNotification({
    required String title,
    required String body,
  }) async {
    await showNotification(
      title: title,
      body: body,
    );
  }

  Future<void> scheduleNotification({
    required String title,
    required String body,
    required DateTime selectedTime,
  }) async {
    // Get the current date
    final now = DateTime.now();

    // Set the notification time to the selected time today
    final scheduledTimeToday = DateTime(
      now.year,
      now.month,
      now.day,
      selectedTime.hour,
      selectedTime.minute,
    );

    // Check if the scheduled time has already passed for today
    if (now.isAfter(scheduledTimeToday)) {
      // If yes, schedule the notification for the selected time tomorrow
      scheduledTimeToday.add(const Duration(days: 1));
    }

    // Schedule the notification
    await notificationsPlugin.zonedSchedule(
      0,
      title,
      body,
      tz.TZDateTime.from(scheduledTimeToday, tz.local),
      notificationDetails(),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
      payload: 'Notification Payload',
    );
  }
}
