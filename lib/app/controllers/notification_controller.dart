import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../utils/function_utils.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import '../config/constant.dart';
import '../routes/app_pages.dart';

class NotificationController extends GetxController {
  var flutterLocalNotificationPlugin = FlutterLocalNotificationsPlugin();
  var box = GetStorage();

  var initializationSettingsAndroid = AndroidInitializationSettings('logo_test');

  Future<void> showNotification(
    int notificationId,
    String notificationTitle,
    String notificationContent,
    String payload, {
    String channelTitle = 'Android Channel',
    String channelDescription = 'Default Android Channel for notifications',
  }) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      channelId,
      channelTitle,
      channelDescription: channelDescription,
      playSound: false,
      importance: Importance.max,
      priority: Priority.high,
    );
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );
    await flutterLocalNotificationPlugin.show(
      notificationId,
      notificationTitle,
      notificationContent,
      platformChannelSpecifics,
      payload: payload,
    );
  }

  void scheduledNotification({
    required int id,
    required DateTime scheduled,
    required String title,
    String? body,
    bool setReminder = true,
    // int? reminderMinute,
  }) async {
    List tempNotes = await box.read(kNotes);
    var stringPayload = json.encode(tempNotes.last);
    var flutterLocalNotificationPlugin = FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(scheduled, tz.local),
      NotificationDetails(
        android: AndroidNotificationDetails(
          channelId,
          'Android Channel',
          channelDescription: 'Default Android Channel for notifications',
          importance: Importance.max,
          priority: Priority.high,
          playSound: true,
        ),
      ),
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
      payload: stringPayload,
    );
    if (setReminder) {
      // scheduled.compareTo(DateTime.now());
      if (DateTime.now().isBefore(tz.TZDateTime.from(scheduled, tz.local).subtract(Duration(minutes: 5)))) {
        await flutterLocalNotificationPlugin.zonedSchedule(
          id + reminderBaseNotifId,
          'Hey 5 menit lagi kamu harus $title, yuk siap-siap',
          body,
          tz.TZDateTime.from(scheduled, tz.local).subtract(Duration(minutes: 5)),
          NotificationDetails(
            android: AndroidNotificationDetails(
              channelId,
              'Android Channel',
              channelDescription: 'Default Android Channel for notifications',
              importance: Importance.max,
              priority: Priority.high,
              playSound: true,
            ),
          ),
          uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
          androidAllowWhileIdle: true,
          payload: stringPayload,
        );
        logKey('reminder set');
      }
    }
  }

  Future<void> cancelScheduledNotif(int id) async {
    await flutterLocalNotificationPlugin.cancel(id);
  }

  Future<void> initFunction() async {
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Asia/Jakarta'));
    // var res = await flutterLocalNotificationPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()!.requestPermission();

    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );
    flutterLocalNotificationPlugin.initialize(
      initializationSettings,
      onSelectNotification: (payload) {
        logKey('payload notifikasi', payload);
        if (payload != null) {
          var notification_data = json.decode(payload);
          Get.toNamed(
            Routes.DETAIL_NOTE,
            arguments: {
              'notification_data': notification_data,
            },
          );
        }
      },
    );
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    initFunction();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
