import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:testbintoro/app/routes/app_pages.dart';

class SplashScreenController extends GetxController {
  var flutterLocalNotificationPlugin = FlutterLocalNotificationsPlugin();

  var text = 'Test app'.obs;
  var showImage = true.obs;

  void initialFunction() async {
    var notifDetail = await flutterLocalNotificationPlugin.getNotificationAppLaunchDetails();
    await Future.delayed(Duration(seconds: 2));
    showImage.value = false;
    await Future.delayed(Duration(seconds: 3));
    Get.offNamed(
      Routes.HOME,
      arguments: {
        'payload': notifDetail!.payload ?? '',
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    initialFunction();
  }

  @override
  void onClose() {}
}
