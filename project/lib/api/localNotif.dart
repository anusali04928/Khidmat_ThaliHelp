import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocalNotif {
  static final _notifications = FlutterLocalNotificationsPlugin();
  static final onNotifications = BehaviorSubject<String>();

  static Future _notificationDetails() async {
    final sound = 'notification_sound.wav';
    return NotificationDetails(
      android: AndroidNotificationDetails(
          'channel id 8', 'channel name', 'channel description',
          // styleInformation: StyleInformation,
          playSound: true,
          importance: Importance.max,
          sound: RawResourceAndroidNotificationSound(sound.split('.').first),
          enableVibration: false),
      iOS: IOSNotificationDetails(sound: sound),
    );
  }

  static Future init({bool initScheduled = false}) async {
    final android = AndroidInitializationSettings('@mipmap/ic_launcher');
    final iOS = IOSInitializationSettings();
    InitializationSettings settings =
        InitializationSettings(android: android, iOS: iOS);
    await _notifications.initialize(settings,
        onSelectNotification: (payload) async {
      onNotifications.add(payload);
    });
    final details = await _notifications.getNotificationAppLaunchDetails();
    if (details != null && details.didNotificationLaunchApp) {
      onNotifications.add(details.payload);
    }
    if (initScheduled) {
      tz.initializeTimeZones();
      final locationName = await FlutterNativeTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(locationName));
    }
  }

  static Future showNotification(
          {int id = 0, String title, String body, String payload}) async =>
      _notifications.show(
        id,
        title,
        body,
        await _notificationDetails(),
        payload: payload,
      );
  static void showScheduledNotification({
    int id = 0,
    String title,
    String body,
    String payload,
    @required DateTime scheduleDate,
    @required List<int> days,
  }) async {
    final scheduledDates = _scheduleWeekly(
        Time(scheduleDate.hour, scheduleDate.minute),
        days: days);

    for (int i = 0; i < scheduledDates.length; i++) {
      final scheduledDate = scheduledDates[i];

      _notifications.zonedSchedule(
        id + i, // choose for each notification an index that is unique
        title,
        body,
        scheduledDate,
        await _notificationDetails(),
        payload: payload,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
      );
    }
  }

  static List<tz.TZDateTime> _scheduleWeekly(Time time,
      {@required List<int> days}) {
    return days.map((day) {
      tz.TZDateTime scheduledDate = _scheduleDaily(time);

      while (day != scheduledDate.weekday) {
        scheduledDate = scheduledDate.add(Duration(days: 1));
      }
      return scheduledDate;
    }).toList();
  }

  static tz.TZDateTime _scheduleDaily(Time time) {
    final now = tz.TZDateTime.now(tz.local);
    final scheduleDate = tz.TZDateTime(tz.local, now.year, now.month, now.day,
        time.hour, time.minute, time.second);
    return scheduleDate.isBefore(now)
        ? scheduleDate.add(Duration(days: 1))
        : scheduleDate;
  }

  static void cancel(int id) => _notifications.cancel(id);
  static void cancelAll(int id) => _notifications.cancelAll();
}
