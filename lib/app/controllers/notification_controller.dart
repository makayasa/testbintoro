import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import '../../utils/function_utils.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import '../config/constant.dart';
import '../routes/app_pages.dart';

class NotificationController extends GetxController {
  var flutterLocalNotificationPlugin = FlutterLocalNotificationsPlugin();

  var initializationSettingsAndroid = AndroidInitializationSettings('logo_aja');

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

  void scheduleTimer({
    required DateTime scheduled,
    required String title,
    String? body,
  }) async {
    var flutterLocalNotificationPlugin = FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationPlugin.zonedSchedule(
      170,
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
        ),
      ),
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
      payload: Routes.NOTIFICATION_DETAIL,
    );
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
          Get.toNamed(payload);
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
